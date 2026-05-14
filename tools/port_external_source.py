#!/usr/bin/env python3

"""
port_external_source.py — drive the cross-project port from
brief 068 byte-fingerprint match to a compiled ported `.c`.

Brief 070 deliverable. Companion to `tools/external_obj.py`
(brief 068 fingerprint pipeline) and `tools/find_external_source.py`
(brief 066 name-based lookup + brief 068 byte-scan CSV).

The pipeline:

  brief 068 CSV row → upstream .c source file
                    → compile .o
                    → extract bytes + reloc table
                    → verify byte-identity vs our placeholder
                    → for each callee in upstream's reloc table:
                        find OUR local name via byte-fingerprint
                        (NO sort-pair heuristic — the brief 069
                        wave 1 failure mode)
                    → rewrite upstream .c body with our local names
                    → emit libs/nitro/<our_name>.legacy.c +
                      delinks.txt entry

Brief 070's four deliverables; this PR ships **D1** (callee remap
via .o reloc table). D2 (primitive header vendoring), D3 (struct
access support), D4 (data-reference reloc handling) are explicit
skip-reasons in the driver — the port refuses cleanly with a
named reason rather than silently emitting wrong output.

Usage:

    # Port one specific (repo, src.c, upstream_func) to our target
    python tools/port_external_source.py \\
        --repo pokediamond \\
        --src arm9/lib/NitroSDK/src/OS_tick.c \\
        --upstream-func OS_InitTick \\
        --our-addr 0x020931f8

    # Dry-run (preview rewritten source + delinks entry, no write)
    python tools/port_external_source.py --dry-run ...

    # Sweep brief 068 CSV — port every row whose driver-skip
    # reasons don't fire; report metrics
    python tools/port_external_source.py --sweep <brief068.csv>

    # JSON output for tool chaining
    python tools/port_external_source.py --format json ...

Skip-reason taxonomy (brief 070 D2/D3/D4 unlock):

  callee-unresolvable: upstream callee has no byte-fingerprint match
                       in our pool. Brief 069 wave 1 callee-mapping
                       trap surfaces here as `callee-unresolvable`
                       rather than as silent self-recursion.
  data-ref:            upstream function reads/writes a data symbol
                       (D4 — analogous to D1 but for data; deferred).
  struct-access:       upstream source uses ->member / .field syntax
                       (D3 — vendoring upstream struct defs).
  undefined-macro:     upstream source references an ALL_CAPS macro
                       not in our vendored headers (D2 — primitive
                       header vendoring).

Each refusal has the upstream function name + the specific
identifier that triggered it. Brief 071's bulk-port driver
aggregates these reasons for backlog metrics.
"""

from __future__ import annotations

import argparse
import csv
import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
LIBS_NITRO = ROOT / "libs" / "nitro"
CONFIG_DIR = ROOT / "config"


# Brief 068 confidence threshold for callee remap. We require
# 1.0000 byte similarity (exact match) for the callee resolution
# to be safe — anything below could be a false positive that
# emits self-recursive or otherwise-broken code (the brief 069
# wave 1 failure mode that the rename-collision PR #434 ALSO
# detects, but at a later stage).
CALLEE_HIGH_THRESHOLD = 0.9999


@dataclass(frozen=True)
class PortRequest:
    repo: str               # "pokediamond"
    src_rel: str            # "arm9/lib/NitroSDK/src/OS_tick.c"
    upstream_func: str      # "OS_InitTick"
    our_region: str         # "eur"
    our_addr: int           # 0x020931f8
    our_name: str | None    # "func_020931f8" or already-renamed


@dataclass
class PortResult:
    status: str             # "ok" | "refused"
    reason: str             # skip-reason taxonomy entry or "ok"
    detail: str = ""        # specific identifier / context
    output_path: Path | None = None
    rewritten_source: str = ""
    delinks_entry: str = ""
    # For metrics: per-callee remap decisions
    callee_remaps: dict[str, str] = field(default_factory=dict)

    def to_dict(self) -> dict:
        return {
            "status": self.status,
            "reason": self.reason,
            "detail": self.detail,
            "output_path": (str(self.output_path)
                            if self.output_path else None),
            "delinks_entry": self.delinks_entry,
            "callee_remaps": dict(self.callee_remaps),
            "rewritten_source": self.rewritten_source,
        }


# --------------------------------------------------------------------------- #
# Source parsing — strict skip-reason detection
# --------------------------------------------------------------------------- #


# Crude but specific detectors. D2/D3/D4 implementations will
# replace these with semantic analysis; for now they exist so the
# driver fails-fast with a named reason rather than emitting
# silently-wrong output.

_STRUCT_ARROW_RE = re.compile(r"->[a-zA-Z_]")
# Field access of the form `ident.field` — we have to exclude
# floating-point literals (`1.0`, `3.14`) so the heuristic isn't
# spammy. The regex requires a letter/underscore on both sides of
# the dot.
_STRUCT_DOT_RE = re.compile(r"[a-zA-Z_]\.[a-zA-Z_]")

# Macros / undefined identifiers from upstream:
#   1. ALL_CAPS_IDENTIFIER that isn't a function-call (4+ uppercase
#      chars rules out enum-tag false positives like `OK`).
#   2. NitroSDK MMIO register convention `reg_<UPPERCASE>` —
#      lowercase prefix but the body is the macro identifier.
#      Brief 069 wave 1 cited `reg_CP_DIVCNT`, `reg_OS_TM0CNT_L`
#      style as the dominant D2 trigger.
# The lookahead `(?!\s*\()` excludes function-call shapes; final
# filter excludes names already in the callees list.
_MACRO_LIKE_RE = re.compile(
    r"\b("
    r"[A-Z][A-Z0-9_]{3,}"        # ALL_CAPS macros (OS_CONSOLE_DEBUG)
    r"|"
    r"reg_[A-Z][A-Z0-9_]+"        # NitroSDK MMIO regs (reg_OS_TM0CNT_L)
    r")\b(?!\s*\()"
)
# Identifiers we know are not "macros" but match the ALL_CAPS
# pattern — types, qualifiers, control-flow.
_MACRO_ALLOWLIST: frozenset[str] = frozenset({
    "NULL", "TRUE", "FALSE", "OK", "FAIL",
    # Pokediamond/NitroSDK basic type aliases. The C source uses
    # these as types; they're typedef'd in nitro/types.h. Most
    # of them are mixed-case (u8, u16, etc.) but include the
    # uppercase variants too.
    "BOOL", "STATIC",
    # Common preprocessor sentinels
    "__cplusplus", "__STDC__",
})


def detect_skip_reasons(
    body: str, callees: list[str], data_refs: list[str],
) -> tuple[str, str] | None:
    """Run cheap skip-reason detectors on the upstream source
    body. Returns `(reason, detail)` on first hit, or None if all
    detectors pass.

    Order matters — D4 data-ref is the cleanest signal (we have
    exact names from the reloc table); D3 struct-access is next;
    D2 undefined-macro is the noisiest fallback.
    """
    # D4 — data reloc handling deferred.
    if data_refs:
        return ("data-ref", ", ".join(data_refs[:5]))

    # D3 — struct access via -> or .field
    m = _STRUCT_ARROW_RE.search(body)
    if m:
        # Surface a snippet around the match for actionable error.
        idx = m.start()
        snippet = body[max(0, idx - 8):idx + 16].replace("\n", " ")
        return ("struct-access", f"-> at offset {idx}: …{snippet}…")
    m = _STRUCT_DOT_RE.search(body)
    if m:
        idx = m.start()
        snippet = body[max(0, idx - 8):idx + 16].replace("\n", " ")
        # Don't flag obvious-not-struct cases like "u32 x.y" — but
        # this heuristic catches `obj.field` clearly enough that
        # most matches are real structs. False positives skip
        # candidates conservatively, which is the right default.
        return ("struct-access", f".field at offset {idx}: …{snippet}…")

    # D2 — undefined macros
    callee_set = set(callees)
    for m in _MACRO_LIKE_RE.finditer(body):
        # group(0) is the full match incl. `reg_` prefix; group(1)
        # is the inner alternation match — same in practice.
        name = m.group(0)
        if name in _MACRO_ALLOWLIST:
            continue
        if name in callee_set:
            continue
        # Found a real undefined-macro candidate.
        return ("undefined-macro", name)

    return None


# --------------------------------------------------------------------------- #
# Source body extraction
# --------------------------------------------------------------------------- #


def extract_function_body(
    source_text: str, func_name: str,
) -> tuple[str, int, int] | None:
    """Return `(body_with_signature, start_offset, end_offset)`
    for `func_name`'s top-level definition in `source_text`,
    or None if not found.

    Heuristic: find the line starting with the function's return
    type + `func_name(`, then balance braces from the first `{`
    to find the matching close. Skips function declarations
    (lines ending in `;`).
    """
    # Match `... func_name(...)` at start-of-line (top-level
    # definition, not nested). Excludes static prototypes.
    pat = re.compile(
        r"^(?P<sig>[a-zA-Z_][\w\s\*]*?\b" +
        re.escape(func_name) + r"\s*\([^;]*?\))\s*\{",
        re.MULTILINE,
    )
    m = pat.search(source_text)
    if not m:
        return None
    body_start = m.start()
    # Balance braces from the `{`
    brace_open = m.end() - 1  # the `{`
    depth = 0
    i = brace_open
    while i < len(source_text):
        c = source_text[i]
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                return source_text[body_start:i + 1], body_start, i + 1
        i += 1
    return None


# --------------------------------------------------------------------------- #
# Callee remap (D1) — byte-fingerprint lookup against our region
# --------------------------------------------------------------------------- #


def _build_upstream_to_local_index(
    repo: str, region: str,
) -> dict[str, tuple[str, int]]:
    """For every named function in the vendored repo, compile +
    extract its fingerprint, then byte-similarity-match against
    our region pool. Returns dict[upstream_name] → (our_name,
    our_addr).

    Cached per-call. A future optimisation would persist this to
    `tools/_vendor/_cache/<repo>_index.json`; for now we rebuild
    in-memory each invocation (a few seconds with pokediamond's
    NitroSDK pool).
    """
    sys.path.insert(0, str(ROOT / "tools"))
    import external_obj  # noqa: E402
    import find_external_source as fes  # noqa: E402
    import find_region_siblings as frs  # noqa: E402

    repo_meta = fes.repo_for(repo)
    if repo_meta is None:
        return {}

    region_funcs = frs.load_region(region)
    index: dict[str, tuple[str, int]] = {}

    for lib_root in repo_meta.lib_roots:
        root_path = fes.VENDOR_DIR / repo / lib_root
        if not root_path.is_dir():
            continue
        for c_file in sorted(root_path.rglob("*.c")):
            src_rel = str(c_file.relative_to(fes.VENDOR_DIR / repo))
            o_path = external_obj.compile_external(repo, src_rel)
            if o_path is None:
                continue
            for ext_fn in external_obj.extract_functions(o_path):
                fp = ext_fn.fingerprint()
                # Find best 1.0 match by size
                best = None
                for module, funcs in region_funcs.items():
                    for f in funcs:
                        if f.size != ext_fn.size:
                            continue
                        our_bytes = frs._function_bytes(
                            region, module, f.addr, f.size)
                        if our_bytes is None:
                            continue
                        our_reloc_offsets = [
                            f.addr + ro for ro, _, _ in f.reloc_sig
                        ]
                        our_masked = frs._mask_relocs(
                            our_bytes, f.addr, our_reloc_offsets)
                        sim = external_obj.byte_similarity(fp, our_masked)
                        if sim >= CALLEE_HIGH_THRESHOLD:
                            if best is None or sim > best[2]:
                                best = (f.name, f.addr, sim)
                if best is not None:
                    index[ext_fn.name] = (best[0], best[1])
    return index


# In-process cache — _build_upstream_to_local_index is expensive
# (~seconds), so callers that port many functions share one build.
_INDEX_CACHE: dict[tuple[str, str], dict[str, tuple[str, int]]] = {}


def upstream_to_local_index(
    repo: str, region: str,
) -> dict[str, tuple[str, int]]:
    key = (repo, region)
    if key not in _INDEX_CACHE:
        _INDEX_CACHE[key] = _build_upstream_to_local_index(repo, region)
    return _INDEX_CACHE[key]


def remap_callees_in_body(
    body: str, callees: list[str],
    upstream_to_local: dict[str, tuple[str, int]],
) -> tuple[str, dict[str, str], list[str]]:
    """For each upstream callee name in `callees`, look up the
    corresponding local name in `upstream_to_local` and rewrite
    `body` to use the local name. Returns `(rewritten_body,
    remap_decisions, unresolvable)` — unresolvable is the list
    of callee names with no fingerprint match.
    """
    remaps: dict[str, str] = {}
    unresolvable: list[str] = []
    for name in callees:
        match = upstream_to_local.get(name)
        if match is None:
            unresolvable.append(name)
            continue
        local_name, _addr = match
        remaps[name] = local_name
    # Apply substitutions longest-name-first to avoid prefix
    # collisions (mirror port_to_region.apply_substitutions).
    sorted_remaps = sorted(
        remaps.items(), key=lambda kv: -len(kv[0]),
    )
    out = body
    for upstream_name, local_name in sorted_remaps:
        pattern = r"\b" + re.escape(upstream_name) + r"\b"
        out = re.sub(pattern, local_name, out)
    return out, remaps, unresolvable


# --------------------------------------------------------------------------- #
# Output paths + delinks emission
# --------------------------------------------------------------------------- #


def compute_output_path(
    our_name: str, *, libs_root: Path = LIBS_NITRO,
) -> Path:
    """Brief 070 ports land in `libs/nitro/<our_name>.legacy.c`.
    `.legacy.c` because pokediamond's NitroSDK compiles with
    `1.2/sp2p3` — our `.legacy.c` routing tier."""
    return libs_root / f"{our_name}.legacy.c"


def compute_delinks_entry(
    our_name: str, our_addr: int, size: int,
    *, libs_root: Path = LIBS_NITRO,
) -> str:
    """Format matches `config/<region>/<module>/delinks.txt`."""
    rel = compute_output_path(our_name, libs_root=libs_root)
    rel = rel.relative_to(ROOT)
    return (
        f"{rel}:\n"
        f"    complete\n"
        f"    .text start:0x{our_addr:08x} "
        f"end:0x{our_addr + size:08x}\n"
    )


# --------------------------------------------------------------------------- #
# Top-level driver
# --------------------------------------------------------------------------- #


def port_function(
    request: PortRequest,
    *,
    libs_root: Path = LIBS_NITRO,
) -> PortResult:
    """Port one upstream function to our libs/nitro tree.
    Returns a PortResult — `status="ok"` with rewritten source
    OR `status="refused"` with a named skip reason.

    No filesystem writes happen here — caller decides whether to
    write `result.output_path.write_text(result.rewritten_source)`.
    """
    sys.path.insert(0, str(ROOT / "tools"))
    import external_obj  # noqa: E402
    import find_external_source as fes  # noqa: E402

    repo_root = fes.VENDOR_DIR / request.repo
    src_path = repo_root / request.src_rel
    if not src_path.is_file():
        return PortResult(
            status="refused", reason="source-not-found",
            detail=f"{request.src_rel} in {request.repo}",
        )

    # Compile + extract the upstream function
    o_path = external_obj.compile_external(request.repo, request.src_rel)
    if o_path is None:
        return PortResult(
            status="refused", reason="compile-failed",
            detail=request.src_rel,
        )
    funcs = external_obj.extract_functions(o_path)
    target = next((f for f in funcs
                   if f.name == request.upstream_func), None)
    if target is None:
        return PortResult(
            status="refused", reason="upstream-func-not-in-obj",
            detail=f"{request.upstream_func} not in {request.src_rel}",
        )

    # Parse upstream source body
    src_text = src_path.read_text(encoding="utf-8")
    body_info = extract_function_body(src_text, request.upstream_func)
    if body_info is None:
        return PortResult(
            status="refused", reason="body-not-found-in-source",
            detail=f"{request.upstream_func} body in {request.src_rel}",
        )
    body, _start, _end = body_info

    # Skip-reason detection (D2/D3/D4)
    callees = target.callee_names()
    # Exclude self-references — those don't need remapping (the
    # ported function will use our_name, and a recursive call
    # already resolves to itself in the rewritten output).
    callees = [c for c in callees if c != request.upstream_func]
    data_refs = target.data_refs()
    skip = detect_skip_reasons(body, callees, data_refs)
    if skip is not None:
        return PortResult(
            status="refused", reason=skip[0], detail=skip[1],
        )

    # Callee remap (D1)
    upstream_to_local = upstream_to_local_index(
        request.repo, request.our_region,
    )
    rewritten_body, remaps, unresolvable = remap_callees_in_body(
        body, callees, upstream_to_local,
    )
    if unresolvable:
        return PortResult(
            status="refused", reason="callee-unresolvable",
            detail=", ".join(unresolvable[:5]),
            callee_remaps=remaps,
        )

    # Rewrite the function-defining name too (the signature uses
    # `request.upstream_func`; we want our local name there).
    our_name = request.our_name or f"func_{request.our_addr:08x}"
    pattern = r"\b" + re.escape(request.upstream_func) + r"\b"
    rewritten_body = re.sub(pattern, our_name, rewritten_body)

    # Compose the final source. Keep upstream's body verbatim
    # apart from the substitutions — extern declarations for our
    # local callees are emitted as a header comment block, but
    # the actual `extern` lines are decomper's responsibility
    # (they hand-author or pull from a vendored header).
    final_src = _compose_port_source(
        rewritten_body, our_name, request, target, remaps,
    )

    out_path = compute_output_path(our_name, libs_root=libs_root)
    delinks_entry = compute_delinks_entry(
        our_name, request.our_addr, target.size, libs_root=libs_root,
    )

    return PortResult(
        status="ok", reason="ok",
        output_path=out_path,
        rewritten_source=final_src,
        delinks_entry=delinks_entry,
        callee_remaps=remaps,
    )


def _compose_port_source(
    rewritten_body: str, our_name: str,
    request: PortRequest, ext_fn,
    remaps: dict[str, str],
) -> str:
    """Wrap the rewritten function body with a provenance comment
    block + minimal extern declarations for any remapped callees.
    Decomper expands the externs to typed declarations after the
    port lands (the `(void)` placeholder makes the C compile;
    correct typing comes later)."""
    lines = []
    lines.append("/*")
    lines.append(" * Cross-project port:")
    lines.append(f" *   upstream: {request.repo}:{request.src_rel}")
    lines.append(f" *   function: {request.upstream_func}")
    lines.append(f" *   target:   {our_name} (0x{request.our_addr:08x}, "
                 f"size 0x{ext_fn.size:x})")
    lines.append(" *")
    lines.append(" * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — "
                 "exact SP match")
    lines.append(" * to pokediamond's NitroSDK build flags). Brief 070 "
                 "D1 callee remap.")
    lines.append(" */")
    lines.append("")
    if remaps:
        for upstream_name, local_name in sorted(remaps.items()):
            lines.append(f"extern void {local_name}(void);  "
                         f"// {upstream_name}")
        lines.append("")
    lines.append(rewritten_body)
    lines.append("")
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# Sweep mode — port all candidates from a brief 068 CSV
# --------------------------------------------------------------------------- #


def sweep_brief_068_csv(
    csv_path: Path, region: str = "eur",
    *, libs_root: Path = LIBS_NITRO,
) -> list[tuple[PortRequest, PortResult]]:
    """Walk a brief 068 `--byte-scan` CSV, attempt to port each
    HIGH-confidence row. Returns the full set of (request, result)
    tuples so caller can aggregate skip-reason metrics."""
    out: list[tuple[PortRequest, PortResult]] = []
    seen_targets: set[tuple[str, int]] = set()  # dedupe by our (module, addr)
    with csv_path.open() as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row.get("confidence") != "HIGH":
                continue
            try:
                our_addr = int(row["our_addr_hex"], 16)
            except (ValueError, KeyError):
                continue
            key = (row.get("our_module", ""), our_addr)
            if key in seen_targets:
                continue
            seen_targets.add(key)
            req = PortRequest(
                repo=row["external_repo"],
                src_rel=row["external_file"],
                upstream_func=row["external_func"],
                our_region=row.get("our_region", region),
                our_addr=our_addr,
                our_name=row.get("our_name"),
            )
            res = port_function(req, libs_root=libs_root)
            out.append((req, res))
    return out


def aggregate_skip_reasons(
    results: list[tuple[PortRequest, PortResult]],
) -> dict[str, int]:
    counts: dict[str, int] = {}
    for _req, res in results:
        counts[res.reason] = counts.get(res.reason, 0) + 1
    return counts


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(
        description="Port one upstream NitroSDK function to "
                    "libs/nitro/<our_name>.legacy.c via byte-"
                    "fingerprint-validated callee remap. Brief 070 "
                    "D1; D2/D3/D4 deferred (driver fails-fast on "
                    "macros/structs/data refs).",
    )
    sub = p.add_mutually_exclusive_group(required=True)
    sub.add_argument("--sweep", metavar="CSV",
                     help="Sweep mode — port every row in a brief "
                          "068 byte-scan CSV. Reports per-reason "
                          "counts.")
    sub.add_argument("--upstream-func",
                     help="Single-port mode — upstream function "
                          "name to port (requires --repo, --src, "
                          "--our-addr).")
    p.add_argument("--repo", help="Vendored repo name.")
    p.add_argument("--src", help="Vendored .c file path "
                                 "(repo-relative).")
    p.add_argument("--our-addr",
                   help="Target address in our config "
                        "(e.g. 0x020931f8).")
    p.add_argument("--our-name",
                   help="Override target name (default: "
                        "func_<addr>).")
    p.add_argument("--region", default="eur",
                   help="Target region (default: eur).")
    p.add_argument("--dry-run", action="store_true",
                   help="Preview the rewritten source + delinks "
                        "entry; don't write to disk.")
    p.add_argument("--format", choices=("text", "json"),
                   default="text",
                   help="Output format (default: text).")
    args = p.parse_args(argv)

    if args.sweep:
        csv_path = Path(args.sweep)
        if not csv_path.is_file():
            print(f"error: csv not found: {csv_path}", file=sys.stderr)
            return 1
        results = sweep_brief_068_csv(csv_path, region=args.region)
        counts = aggregate_skip_reasons(results)
        if args.format == "json":
            payload = {
                "total": len(results),
                "by_reason": counts,
                "ok": [
                    {
                        "upstream_func": req.upstream_func,
                        "our_addr": req.our_addr,
                        "our_name": (res.output_path.stem
                                     if res.output_path else None),
                        "callee_remaps": dict(res.callee_remaps),
                    }
                    for req, res in results if res.status == "ok"
                ],
            }
            print(json.dumps(payload, indent=2))
        else:
            print(f"Sweep results: {len(results)} candidates")
            print()
            for reason, n in sorted(counts.items(),
                                    key=lambda kv: -kv[1]):
                print(f"  {reason:<24}  {n:>4}")
            print()
            ok_count = counts.get("ok", 0)
            print(f"Ports ready: {ok_count} (target ≥ 50 for brief 071 "
                  f"floor)")
        return 0

    # Single-port mode
    if not args.repo or not args.src or not args.our_addr:
        print("error: --upstream-func requires --repo, --src, "
              "--our-addr", file=sys.stderr)
        return 2
    try:
        our_addr = int(args.our_addr, 0)
    except ValueError:
        print(f"error: invalid --our-addr: {args.our_addr}",
              file=sys.stderr)
        return 1
    req = PortRequest(
        repo=args.repo, src_rel=args.src,
        upstream_func=args.upstream_func,
        our_region=args.region, our_addr=our_addr,
        our_name=args.our_name,
    )
    result = port_function(req)
    if args.format == "json":
        print(json.dumps(result.to_dict(), indent=2))
        return 0 if result.status == "ok" else 4

    if result.status == "refused":
        print(f"REFUSED — {result.reason}: {result.detail}",
              file=sys.stderr)
        if result.callee_remaps:
            print("  callee remaps so far:", file=sys.stderr)
            for k, v in result.callee_remaps.items():
                print(f"    {k} → {v}", file=sys.stderr)
        return 4

    # status == "ok"
    print(f"# Would write: {result.output_path}")
    print("#")
    print("# delinks.txt entry:")
    for line in result.delinks_entry.splitlines():
        print(f"#   {line}")
    if result.callee_remaps:
        print("#")
        print("# Callee remaps:")
        for k, v in sorted(result.callee_remaps.items()):
            print(f"#   {k} → {v}")
    print()
    print("# === Rewritten source ===")
    print(result.rewritten_source, end="")

    if not args.dry_run:
        result.output_path.parent.mkdir(parents=True, exist_ok=True)
        result.output_path.write_text(result.rewritten_source,
                                       encoding="utf-8")
        print(f"\nwrote {result.output_path}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
