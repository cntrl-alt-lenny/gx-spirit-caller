#!/usr/bin/env python3

"""
find_external_source.py — locate upstream `.c` source for our
unmatched functions, mining vendored decomp repos.

Brief 066 research prototype. Companion to `find_region_siblings.py`
(same shape, same output format) but the correspondence space is
*across decomp projects* rather than across regions of our own ROM.

The vendored upstream pool comes from `tools/vendor_external_sources.py`
under `tools/_vendor/<repo>/<lib_root>/...`. v0 surfaces candidates
via **function-name matching** — useful for the already-named portion
of our symbol pool (e.g. BIOS syscall thunks like `IntrWait`,
`CpuSet`, `Halt`). Full **byte-fingerprint matching** for unnamed
`func_<addr>` candidates is the natural next step (brief 068
implementation); v0 documents the hook in `Candidate.byte_score`
and leaves it as None until the .o-extraction pipeline lands.

Usage:

    # Look up by symbol name (works today for already-named symbols)
    python tools/find_external_source.py --name IntrWait

    # Look up by (module, addr) — resolves the name via symbols.txt,
    # then queries the vendored pool. Useful for piping from
    # next_targets.py / data_worklist.py.
    python tools/find_external_source.py --module main --addr 0x02000086

    # JSON output for tool chaining
    python tools/find_external_source.py --name CpuSet --format json

    # Pin region (default: eur)
    python tools/find_external_source.py --name OS_GetTick --region usa

Output (matches `find_region_siblings.py` shape):

    Query: IntrWait (main +0x02000086)
    3 candidates from 1 vendored repo:

      [HIGH]   pokediamond  arm9/lib/NitroSDK/src/OS_intr.c:42  score=1.00
        Same function name; mwcc 2.0/sp1 vs ours 2.0/sp1p5 (close SP)
      [MEDIUM] pokeheartgold lib/NitroSDK/src/os/OS_intr.c:38   score=0.85
        Same function name; mwcc 2.0/sp2p2 vs ours 2.0/sp1p5 (further)

The score model for v0 is intentionally simple: same function name
across compatible SP versions = HIGH; same name across more-distant
SP = MEDIUM; partial-name match = LOW. Byte-similarity (when available
via the brief 068 implementation) will replace the simple-name match
as the dominant signal.

Non-scope (per brief 066):
- ❌ Building external `.o` files / running byte-fingerprint matching
  (deferred to brief 068 implementation).
- ❌ Auto-importing the source into our `libs/` tree.
- ❌ Modifying upstream vendored sources.
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
VENDOR_DIR = ROOT / "tools" / "_vendor"
CONFIG_DIR = ROOT / "config"

# Byte-similarity thresholds for the brief 068 byte-fingerprint
# pipeline. Tuned against the OS_tick.c sample run
# (all matches landed at 1.000 against our `.legacy.c`-SP-aligned
# pokediamond NitroSDK pool). The MEDIUM/LOW bands give us
# headroom for functions whose reloc tables differ slightly across
# regions or where mwccarm's optimiser made a different choice.
BYTE_HIGH_THRESHOLD = 0.95
BYTE_MEDIUM_THRESHOLD = 0.80


# Our toolchain's default mwcc SP. Vendored repos at this exact SP
# get the cleanest fingerprint matches; further SPs may have
# peephole/optimiser drift (see codegen-walls.md C-15 for the
# canonical example).
OUR_MWCC_SP = "2.0/sp1p5"

# SP-distance scoring: how confident are we that two SPs emit the
# same bytes for the same source? Values are heuristic — refined
# by brief 068 against actual byte-fingerprint hit rates.
#
# Same major+minor+SP = best. Same major+minor different SP-rev =
# usually still very close (most peephole changes are at SP-major
# boundaries). Different major+minor = expect divergence.
SP_DISTANCE: dict[str, int] = {
    # exact match
    "2.0/sp1p5": 0,
    # one SP-rev off, same major+minor — peephole drift possible
    "2.0/sp1": 1,
    "2.0/sp1p4": 1,
    "2.0/sp1p2": 1,
    # SP-level shift (sp1 → sp2), peephole-pass changes substantial
    "2.0/sp2": 2,
    "2.0/sp2p2": 2,
    "2.0/sp2p3": 2,
    "2.0/sp2p4": 2,
    # Different major+minor (1.2 family) — these are our legacy
    # routing tiers; functions can match if our .legacy.c routing
    # is appropriate
    "1.2/sp2p3": 3,
    "1.2/sp3": 3,
    "1.2p1": 3,
    "1.2/base": 4,
    # DSi family — different ISA-mode + optimiser pipeline
    "dsi/1.2p1": 5,
    "dsi/1.2": 5,
}


# Vendored-repo metadata — duplicated from vendor_external_sources.py
# so this tool is self-contained. The two lists must agree on
# (name, mwcc_sp, lib_roots); a unit test pins them.
@dataclass(frozen=True)
class Repo:
    name: str
    mwcc_sp: str
    lib_roots: tuple[str, ...]


REPOS: list[Repo] = [
    Repo(
        name="pokediamond",
        mwcc_sp="2.0/sp1",
        lib_roots=(
            "arm9/lib/NitroSDK/src",
            "arm9/lib/MSL_C/MSL_Common/Src",
            "arm9/lib/libnns/src",
        ),
    ),
    Repo(
        name="pokeheartgold",
        mwcc_sp="2.0/sp2p2",
        lib_roots=(
            "lib/NitroSDK/src/mi",
            "lib/NitroSDK/src/os",
            "lib/MSL_C",
            "lib/NitroDWC",
            "lib/dsprot",
        ),
    ),
    Repo(
        name="st",
        mwcc_sp="dsi/1.2p1",
        lib_roots=(
            "libs/c",
            "libs/cpp",
            "libs/runtime",
        ),
    ),
]


# Function-definition regex. Matches a top-level function definition
# line like:
#     void OS_GetTick(void) {
#     int  MI_CpuCopy16(const void *src, void *dst, u32 len) {
#     u32 strlen(const char *s) {
#
# Captures the function name. Tolerates pointer-spelled return
# types (`u8 *`, `void*`) and qualified names. Open-brace on same
# line is the most common style across all three target repos; for
# the rarer brace-on-next-line case, the matcher catches the
# parameter-list line and consults the next non-empty line for `{`.
FUNC_DEF_RE = re.compile(
    # Optional storage / qualifier prefix
    r"^(?:static\s+|inline\s+|extern\s+|asm\s+)*"
    # Return type (alpha + optional pointer)
    r"(?:[a-zA-Z_][\w*\s]*?\s|\*\s*)"
    # Function name
    r"(?P<name>[a-zA-Z_]\w*)"
    # Parameter list (greedy to end of line, may span lines)
    r"\s*\("
)


@dataclass(frozen=True)
class ExternalFunc:
    """One function definition discovered in a vendored .c file."""
    repo: str               # "pokediamond"
    file_rel: str           # "arm9/lib/NitroSDK/src/OS_intr.c"
    line: int               # 1-indexed source line
    name: str               # "OS_GetTick"


@dataclass
class Candidate:
    """A ranked candidate match for a query function."""
    func: ExternalFunc
    confidence: str           # 'HIGH', 'MEDIUM', 'LOW', 'NONE'
    score: float              # 0.0..1.0
    rationale: str
    # Byte-fingerprint score is populated by brief 068's
    # implementation when external .o files are built. v0 leaves
    # it None.
    byte_score: float | None = None
    notes: list[str] = field(default_factory=list)


# --------------------------------------------------------------------------- #
# Vendored-pool indexing
# --------------------------------------------------------------------------- #


def _extract_functions_from_file(
    path: Path, repo_name: str, repo_root: Path,
) -> list[ExternalFunc]:
    """Walk one .c file and yield every top-level function definition.

    The matcher is intentionally lenient — false positives (e.g. a
    `if (foo(` line at column 0) are filtered by requiring an
    immediately-following balanced parenthesis + `{`. Misses on
    exotic-formatting functions are acceptable for v0; the cost is
    a few NitroSDK functions not surfaced as candidates, which
    brief 068's byte-fingerprint pass will catch anyway.
    """
    out: list[ExternalFunc] = []
    try:
        text = path.read_text(encoding="utf-8", errors="replace")
    except OSError:
        return out
    for i, line in enumerate(text.splitlines(), start=1):
        # Skip obvious non-definitions
        if not line or line[0] in " \t/#":
            continue
        m = FUNC_DEF_RE.match(line)
        if not m:
            continue
        name = m.group("name")
        # Filter obvious noise:
        # - C keywords / control flow that match the shape
        if name in {"if", "while", "for", "switch", "return", "sizeof",
                    "case", "typedef", "struct", "union", "enum",
                    "static", "extern", "inline", "asm", "do",
                    "goto"}:
            continue
        rel = str(path.relative_to(repo_root))
        out.append(ExternalFunc(
            repo=repo_name,
            file_rel=rel,
            line=i,
            name=name,
        ))
    return out


def build_external_index(
    vendor_dir: Path = VENDOR_DIR,
) -> dict[str, list[ExternalFunc]]:
    """Scan every vendored repo's lib_roots for .c files and index
    by function name. Returns dict[name] → list of ExternalFunc.

    Multiple repos may define the same function (e.g. both
    pokediamond and pokeheartgold ship `OS_GetTick`); all are
    returned and ranked by SP distance later.
    """
    index: dict[str, list[ExternalFunc]] = {}
    for repo in REPOS:
        repo_root = vendor_dir / repo.name
        if not repo_root.is_dir():
            # Not cloned yet — skip silently. Caller surfaces this
            # via `--list-pools` or by checking for an empty index.
            continue
        for lib_root in repo.lib_roots:
            root = repo_root / lib_root
            if not root.is_dir():
                continue
            for c_file in root.rglob("*.c"):
                for fn in _extract_functions_from_file(
                        c_file, repo.name, repo_root):
                    index.setdefault(fn.name, []).append(fn)
    return index


def repo_for(repo_name: str) -> Repo | None:
    """Look up a Repo by name."""
    for r in REPOS:
        if r.name == repo_name:
            return r
    return None


# --------------------------------------------------------------------------- #
# Query → ranking
# --------------------------------------------------------------------------- #


def _sp_distance(repo_sp: str) -> int:
    """SP-distance score (smaller = closer to our default)."""
    return SP_DISTANCE.get(repo_sp, 10)  # unknown SP defaults to far


def _confidence_for_distance(dist: int) -> tuple[str, float, str]:
    """Map SP-distance to (confidence, score, rationale_suffix)."""
    if dist == 0:
        return "HIGH", 1.00, "SP exact match"
    if dist <= 1:
        return "HIGH", 0.92, "SP one rev off, same major+minor"
    if dist <= 2:
        return "MEDIUM", 0.80, "SP-level shift; peephole drift possible"
    if dist <= 3:
        return "MEDIUM", 0.65, "different mwcc family (1.2 vs 2.0)"
    return "LOW", 0.40, "distant SP / family"


def lookup_by_name(
    name: str,
    index: dict[str, list[ExternalFunc]],
) -> list[Candidate]:
    """Surface every external function with the given exact name,
    ranked by SP distance from our default."""
    raw = index.get(name, [])
    candidates: list[Candidate] = []
    for fn in raw:
        repo = repo_for(fn.repo)
        if repo is None:
            continue
        dist = _sp_distance(repo.mwcc_sp)
        conf, score, suffix = _confidence_for_distance(dist)
        rationale = (
            f"exact-name match in {fn.repo} "
            f"(mwcc {repo.mwcc_sp} vs ours {OUR_MWCC_SP}); "
            f"{suffix}"
        )
        candidates.append(Candidate(
            func=fn,
            confidence=conf,
            score=score,
            rationale=rationale,
            byte_score=None,
            notes=[
                "v0 prototype: name-only matching. Byte-fingerprint "
                "verification deferred to brief 068 implementation.",
            ],
        ))
    # Sort: HIGH first, then by score desc
    conf_rank = {"HIGH": 3, "MEDIUM": 2, "LOW": 1, "NONE": 0}
    candidates.sort(
        key=lambda c: (-conf_rank.get(c.confidence, 0), -c.score)
    )
    return candidates


def resolve_name_for_address(
    region: str, module: str, addr: int,
) -> str | None:
    """Resolve a (region, module, addr) tuple to the function name
    in symbols.txt. Returns None if the symbol is still
    `func_<addr>` (unnamed) or not found.

    Module paths:
        main          → config/<r>/arm9/symbols.txt
        ov<NNN>       → config/<r>/arm9/overlays/ov<NNN>/symbols.txt
        itcm / dtcm   → config/<r>/arm9/{itcm,dtcm}/symbols.txt
    """
    if module == "main":
        syms_path = CONFIG_DIR / region / "arm9" / "symbols.txt"
    elif module in ("itcm", "dtcm"):
        syms_path = CONFIG_DIR / region / "arm9" / module / "symbols.txt"
    elif module.startswith("ov"):
        n = module[2:]
        syms_path = (CONFIG_DIR / region / "arm9" / "overlays"
                     / ("ov" + n.zfill(3)) / "symbols.txt")
    else:
        return None
    if not syms_path.is_file():
        return None
    needle = f"addr:0x{addr:08x}"
    for line in syms_path.read_text(encoding="utf-8").splitlines():
        if needle in line:
            return line.split(" ", 1)[0]
    return None


# --------------------------------------------------------------------------- #
# Byte-fingerprint pipeline (brief 068)
# --------------------------------------------------------------------------- #


@dataclass(frozen=True)
class ByteMatch:
    """One byte-fingerprint match between an external function and
    one of our unmatched candidates. Output row format for the
    CSV that decomper brief 069 consumes."""
    external_repo: str
    external_file: str
    external_func: str
    external_size: int
    our_region: str
    our_module: str
    our_name: str          # `func_<addr>` or already-renamed symbol
    our_addr: int
    similarity: float
    confidence: str        # "HIGH" / "MEDIUM" / "LOW"


def _confidence_for_similarity(sim: float) -> str:
    if sim >= BYTE_HIGH_THRESHOLD:
        return "HIGH"
    if sim >= BYTE_MEDIUM_THRESHOLD:
        return "MEDIUM"
    return "LOW"


def byte_scan_repo(
    repo: str, region: str,
    *,
    limit_files: int | None = None,
    min_similarity: float = BYTE_MEDIUM_THRESHOLD,
) -> list[ByteMatch]:
    """Compile every vendored `.c` file in the repo's lib_roots,
    extract per-function fingerprints, match each external function
    against all our same-size candidates in `region`. Returns
    every match at or above `min_similarity`.

    Lazy-imports `external_obj` and `find_region_siblings` — the
    byte-fingerprint path has a wine + ELF-parse dependency that
    the v0 name-only mode doesn't need.
    """
    # Lazy imports
    _here = Path(__file__).resolve().parent
    sys.path.insert(0, str(_here))
    import external_obj  # noqa: E402
    import find_region_siblings as frs  # noqa: E402

    repo_meta = repo_for(repo)
    if repo_meta is None:
        return []

    # Load our region pool once
    region_funcs = frs.load_region(region)

    matches: list[ByteMatch] = []
    files_scanned = 0
    for lib_root in repo_meta.lib_roots:
        root_path = VENDOR_DIR / repo / lib_root
        if not root_path.is_dir():
            continue
        for c_file in sorted(root_path.rglob("*.c")):
            if limit_files is not None and files_scanned >= limit_files:
                break
            files_scanned += 1
            src_rel = str(c_file.relative_to(VENDOR_DIR / repo))
            o_path = external_obj.compile_external(repo, src_rel)
            if o_path is None:
                continue
            for ext_fn in external_obj.extract_functions(o_path):
                fp = ext_fn.fingerprint()
                # Find our matching-size candidates across all modules
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
                        if sim < min_similarity:
                            continue
                        matches.append(ByteMatch(
                            external_repo=repo,
                            external_file=src_rel,
                            external_func=ext_fn.name,
                            external_size=ext_fn.size,
                            our_region=region,
                            our_module=module,
                            our_name=f.name,
                            our_addr=f.addr,
                            similarity=sim,
                            confidence=_confidence_for_similarity(sim),
                        ))
    # Sort: HIGH first, then by similarity desc, then by external addr
    conf_rank = {"HIGH": 3, "MEDIUM": 2, "LOW": 1}
    matches.sort(key=lambda m: (
        -conf_rank.get(m.confidence, 0),
        -m.similarity,
        m.external_func,
    ))
    return matches


def render_csv(matches: list[ByteMatch]) -> str:
    """CSV format consumed by decomper brief 069's bulk-port wave.
    Columns are chosen so the decomper can grep the HIGH rows and
    pull the external `.c` file for inspection."""
    buf = []
    writer = csv.writer(_BufWriter(buf))
    writer.writerow([
        "confidence", "similarity",
        "external_repo", "external_file", "external_func",
        "external_size",
        "our_region", "our_module", "our_name", "our_addr_hex",
    ])
    for m in matches:
        writer.writerow([
            m.confidence,
            f"{m.similarity:.4f}",
            m.external_repo,
            m.external_file,
            m.external_func,
            f"0x{m.external_size:04x}",
            m.our_region,
            m.our_module,
            m.our_name,
            f"0x{m.our_addr:08x}",
        ])
    return "".join(buf)


class _BufWriter:
    """csv.writer needs a `.write(str)` target. List-of-strings
    buffer keeps the output in-memory + lets us return it from
    `render_csv`."""

    def __init__(self, buf: list):
        self.buf = buf

    def write(self, s: str) -> None:
        self.buf.append(s)


# --------------------------------------------------------------------------- #
# Output rendering
# --------------------------------------------------------------------------- #


def render_text(
    query_name: str,
    query_module: str | None,
    query_addr: int | None,
    candidates: list[Candidate],
) -> str:
    lines: list[str] = []
    loc = ""
    if query_module is not None:
        loc = f" ({query_module}" + (
            f" +0x{query_addr:08x}" if query_addr is not None else ""
        ) + ")"
    lines.append(f"Query: {query_name}{loc}")
    if not candidates:
        lines.append("")
        lines.append("No candidates in vendored pool. Either the "
                     "vendored cache is empty (run "
                     "`tools/vendor_external_sources.py` first) or "
                     "this function isn't in any indexed repo.")
        return "\n".join(lines) + "\n"
    repos = sorted({c.func.repo for c in candidates})
    lines.append(f"{len(candidates)} candidate(s) from "
                 f"{len(repos)} vendored repo(s):")
    lines.append("")
    for c in candidates:
        lines.append(
            f"  [{c.confidence}] {c.func.repo}  "
            f"{c.func.file_rel}:{c.func.line}  "
            f"score={c.score:.2f}"
        )
        lines.append(f"    {c.rationale}")
        for note in c.notes:
            lines.append(f"    note: {note}")
    return "\n".join(lines) + "\n"


def render_json(
    query_name: str,
    query_module: str | None,
    query_addr: int | None,
    candidates: list[Candidate],
) -> str:
    payload = {
        "query": {
            "name": query_name,
            "module": query_module,
            "addr": query_addr,
        },
        "candidates": [
            {
                "repo": c.func.repo,
                "file": c.func.file_rel,
                "line": c.func.line,
                "name": c.func.name,
                "confidence": c.confidence,
                "score": c.score,
                "byte_score": c.byte_score,
                "rationale": c.rationale,
                "notes": c.notes,
            }
            for c in candidates
        ],
    }
    return json.dumps(payload, indent=2) + "\n"


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(
        description="Find upstream `.c` source for our unmatched "
                    "functions by mining vendored decomp repos. "
                    "Brief 066 (name-based) + brief 068 "
                    "(--byte-scan: byte-fingerprint pipeline).",
    )
    p.add_argument("--name", help="Function name to look up "
                                  "(e.g. IntrWait, OS_GetTick).")
    p.add_argument("--module", help="Module name "
                                    "(main, ov002, itcm, …).")
    p.add_argument("--addr", help="Function address "
                                  "(e.g. 0x02000086).")
    p.add_argument("--region", default="eur",
                   help="Region for address lookup (default: eur).")
    p.add_argument("--format", choices=("text", "json", "csv"),
                   default="text",
                   help="Output format. csv is required for "
                        "--byte-scan (brief 069 consumes it).")
    p.add_argument("--list-pools", action="store_true",
                   help="Print which repos are cloned + index size.")
    # Brief 068 — byte-fingerprint scan
    p.add_argument("--byte-scan", metavar="REPO",
                   help="Scan all vendored .c files in REPO, compile "
                        "+ fingerprint each function, match against "
                        "our region pool by byte similarity. Output "
                        "as CSV for brief 069's bulk-port wave.")
    p.add_argument("--byte-scan-limit-files", type=int, default=None,
                   help="Cap the number of .c files compiled per "
                        "scan (for sample validation / dry-run).")
    p.add_argument("--byte-scan-min-similarity", type=float, default=None,
                   help="Minimum byte-similarity threshold "
                        "(default: 0.80 = MEDIUM band; use 0.95 for "
                        "HIGH-only).")
    args = p.parse_args(argv)

    if args.byte_scan:
        if args.format != "csv":
            print("note: --byte-scan output is CSV; ignoring --format "
                  f"{args.format}.", file=sys.stderr)
        min_sim = (args.byte_scan_min_similarity
                   if args.byte_scan_min_similarity is not None
                   else BYTE_MEDIUM_THRESHOLD)
        matches = byte_scan_repo(
            args.byte_scan, args.region,
            limit_files=args.byte_scan_limit_files,
            min_similarity=min_sim,
        )
        sys.stdout.write(render_csv(matches))
        return 0

    if args.list_pools:
        for repo in REPOS:
            repo_root = VENDOR_DIR / repo.name
            status = "✓" if repo_root.is_dir() else "✗ (not cloned)"
            print(f"  {repo.name:<14} {status:<20} "
                  f"mwcc {repo.mwcc_sp}")
        # Build the index to count
        index = build_external_index()
        total = sum(len(v) for v in index.values())
        print(f"\n{total} function definitions indexed across "
              f"{len(index)} unique names.")
        return 0

    # Resolve query name
    query_name: str | None = args.name
    query_module: str | None = args.module
    query_addr: int | None = None
    if args.addr is not None:
        try:
            query_addr = int(args.addr, 0)
        except ValueError:
            print(f"error: invalid --addr value: {args.addr}",
                  file=sys.stderr)
            return 1
    if query_name is None:
        if query_module is None or query_addr is None:
            print("error: provide --name OR both --module and --addr",
                  file=sys.stderr)
            return 2
        query_name = resolve_name_for_address(
            args.region, query_module, query_addr,
        )
        if query_name is None:
            print(
                f"error: no symbol at "
                f"{args.region}:{query_module}:0x{query_addr:08x}",
                file=sys.stderr,
            )
            return 3
        if query_name.startswith("func_"):
            print(
                f"note: symbol at {query_module}:0x{query_addr:08x} "
                f"is still {query_name} (unnamed). v0 prototype only "
                f"supports name-based lookup; byte-fingerprint matching "
                f"for unnamed func_<addr> candidates is deferred to "
                f"brief 068 implementation.",
                file=sys.stderr,
            )
            # Don't bail — let the user see the empty result for
            # consistency. JSON output stays valid.

    index = build_external_index()
    candidates = lookup_by_name(query_name, index)

    if args.format == "json":
        sys.stdout.write(render_json(
            query_name, query_module, query_addr, candidates,
        ))
    else:
        sys.stdout.write(render_text(
            query_name, query_module, query_addr, candidates,
        ))
    return 0


if __name__ == "__main__":
    sys.exit(main())
