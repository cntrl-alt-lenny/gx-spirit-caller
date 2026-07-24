#!/usr/bin/env python3
"""
wall_aware_headroom.py — TRUE readable-C headroom (walls subtracted).

The raw C% metric (progress.py) counts every not-yet-`.c` byte as "headroom",
including functions that are documented permanent walls. Brief 640's audit
(docs/research/brief-640-wall-audit.md) found the PREVIOUS version of this
tool badly over-counted "wall": its regex treated ANY `[CP]-\\d+` taxonomy
citation as permanent, and treated the blanket GLOBAL_ASM / brief 294+302
whole-function-ship header (emitted unconditionally by every
`asm_escape.py --whole-function` carve — see that file's `generate_whole()`)
as if it were per-function proof of C-irreducibility. It is not: it is a
bulk stamp from a mechanical carving tool. 0 of 5 brief-640 sample citations
even matched their own cited taxonomy entry's criteria.

`docs/research/codegen-walls.md` splits its catalogue into two buckets that
this tool now keeps distinct:
  - **C-NN** = "coercible with knowledge" — a specific C source variation or
    routing tier is DOCUMENTED to beat it. Citing C-NN means "here is the
    lever," not "this is impossible."
  - **P-NN** = "permanent" — every source variation across all mwcc SPs was
    swept and none matched. This is the only taxonomy bucket that means
    "don't bother."

Classification (brief 651), highest-priority match wins:
  1. **permanent** — an unconditional `mcr`/`mrc`/`swi`/`msr`/`mrs`
     instruction in the body (genuinely inexpressible in portable C without
     inline asm), OR a `P-NN` taxonomy citation. `asm_escape.py`'s own
     `_DATA_AS_CODE_RE` (brief 488) already established that the
     CONDITIONAL form of these mnemonics (`mcrne`, `svclt`, ...) is ALWAYS
     disguised non-code data in this specific game's disassembly, never a
     genuine privileged instruction — so only the bare/unconditional form
     counts as ISA-impossible evidence here.
  2. **coercible** — a `C-NN` taxonomy citation. Reported WITH the code(s)
     so the operator can look up the lever in codegen-walls.md instead of
     re-deriving it.
  3. **unknown** — the blanket GLOBAL_ASM / brief-294/302 cohort stamp, or
     other free-form wall prose ("reg-alloc wall", "no C match", "ship-as-
     .s", "permanent wall", "endgame") with no citable code. This is a
     mechanical-tool bulk stamp or an unverifiable assertion, NOT per-
     function evidence — brief 640 confirmed the overwhelming majority of
     files in this bucket (ov002's 2,773) were carved by pure size-tier
     sweeps with zero C-drafting attempts. Reported as a real candidate,
     just flagged as never independently assessed.
  4. **no_marker** — nothing matched. Was already correctly treated as
     convertible by the previous tool; unchanged here.

`candidate` = coercible + unknown + no_marker (everything that ISN'T a
verified-permanent wall). This is still an UPPER BOUND, not a work-list —
header-read before compiling, same caveat as before.

EUR baseline only (`src/main/`, `src/overlayNNN/` — no `src/usa|jpn/` region
ports, which follow the EUR C source once it exists rather than being
independently triaged).

Usage:
    python tools/wall_aware_headroom.py                # per-module table
    python tools/wall_aware_headroom.py --json         # machine-readable
    python tools/wall_aware_headroom.py --min 5        # only modules with >=5 candidates
    python tools/wall_aware_headroom.py --coercible     # list coercible files + codes
"""
from __future__ import annotations

import argparse
import csv
import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

from parsers import parse_delinks_file, parse_symbols_file

ROOT = Path(__file__).resolve().parent.parent
# EUR baseline module dirs only (region ports live under src/usa, src/jpn).
_MODULE_RE = re.compile(r"^src/(main|overlay\d+)/[^/]+\.s$")

# Taxonomy citations: e.g. "C-34", "P-11", "C-39a" (lettered sub-variants).
_P_CITE_RE = re.compile(r"\bP-\d+[a-z]?\b")
_C_CITE_RE = re.compile(r"\bC-\d+[a-z]?\b")

# Bare/unconditional mnemonic only, at the start of an instruction line (not
# a comment: comment lines in this project's `.s` files start with `;`, so a
# leading-whitespace-then-mnemonic match can't land on a comment's prose).
# Deliberately excludes the conditional forms (mcrne, svclt, msreq, ...) --
# asm_escape.py's _DATA_AS_CODE_RE established those are always disguised
# data in this game, never a real privileged instruction.
_ISA_IMPOSSIBLE_RE = re.compile(r"^[ \t]*(?:mcr|mrc|swi|msr|mrs)[ \t]", re.M)

# The asm_escape.py generate_whole() boilerplate + brief 294/302 framing.
_COHORT_RE = re.compile(r"GLOBAL_ASM|brief[ _]?29[04]\b|brief[ _]?302\b", re.I)

# Other free-form wall prose with no citable taxonomy code (brief-578-style
# data-blob headers, ad hoc "reg-alloc wall" notes, etc.) -- still not
# per-function-verified, bucketed the same as the cohort stamp.
_PROSE_RE = re.compile(
    r"reg-?alloc wall|no C match|ship-as-\.s|whole-function ship|"
    r"permanent wall|endgame",
    re.I,
)


@dataclass
class Classification:
    kind: str  # "permanent" | "coercible" | "unknown" | "no_marker"
    codes: list[str] = field(default_factory=list)  # taxonomy codes, if any


def classify_text(text: str) -> Classification:
    """PURE: classify one `.s` file's full text. See module docstring for
    the 4-class scheme and priority order."""
    if _ISA_IMPOSSIBLE_RE.search(text):
        return Classification("permanent")
    p_codes = sorted(set(_P_CITE_RE.findall(text)))
    if p_codes:
        return Classification("permanent", p_codes)
    c_codes = sorted(set(_C_CITE_RE.findall(text)))
    if c_codes:
        return Classification("coercible", c_codes)
    if _COHORT_RE.search(text) or _PROSE_RE.search(text):
        return Classification("unknown")
    return Classification("no_marker")


def classify_path(path: Path) -> Classification:
    try:
        return classify_text(path.read_text(encoding="utf-8", errors="ignore"))
    except OSError:
        return Classification("no_marker")


_SRC_REF_RE = re.compile(r"^(src/\S+\.(?:c|s)):")


def _live_sources() -> set[str]:
    """Every src path actually referenced by a committed delinks.txt — the real
    build inputs. Files on disk NOT in this set are orphans (CC Decomper,
    2026-07-21: brief-071's bulk-port relocated functions to libs/nitro and
    repointed delinks, but left dead `.s` copies under src/ — 29 project-wide).
    Counting those inflates headroom, so we skip them."""
    refs: set[str] = set()
    for d in (ROOT / "config").rglob("delinks.txt"):
        for line in d.read_text(encoding="utf-8", errors="ignore").splitlines():
            m = _SRC_REF_RE.match(line.strip())
            if m:
                refs.add(m.group(1))
    return refs


def _source_module(rel: str) -> str:
    """Map an EUR source path to dsd's symbol-module name."""
    m = _MODULE_RE.match(rel)
    if not m:
        return ""
    return "main" if m.group(1) == "main" else f"ov{m.group(1)[7:]}"


def _delink_text_sizes() -> dict[str, int]:
    """Return each live source TU's committed `.text` span in bytes."""
    sizes: dict[str, int] = {}
    for delinks in (ROOT / "config").rglob("delinks.txt"):
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if not source.startswith("src/") or not source.endswith(".s"):
                continue
            size = sum(
                max(0, end - start)
                for name, start, end in tu.get("sections", [])
                if name == ".text"
            )
            # Region-specific source paths are distinct, while the EUR
            # baseline paths used by this selector are unique. Keep the
            # largest observed span if a generated config repeats a path.
            sizes[source] = max(size, sizes.get(source, 0))
    return sizes


def _symbol_addresses() -> dict[tuple[str, str], str]:
    """Index EUR function symbols as stable human-readable hex addresses."""
    addresses: dict[tuple[str, str], str] = {}
    eur_arm9 = ROOT / "config" / "eur" / "arm9"
    symbol_files = [eur_arm9 / "symbols.txt"] + sorted(
        (eur_arm9 / "overlays").glob("ov*/symbols.txt")
    )
    for symbols_file in symbol_files:
        if symbols_file.parent.name == "arm9":
            module = "main"
        else:
            module = symbols_file.parent.name
        for symbol in parse_symbols_file(symbols_file, module):
            if symbol.is_function:
                addresses[(module, symbol.name)] = f"0x{symbol.addr:08x}"
    return addresses


_ADDR_SUFFIX_RE = re.compile(r"(?:^|_)([0-9a-fA-F]{8})$")


def _file_metadata(
    rel: str, text_sizes: dict[str, int], addresses: dict[tuple[str, str], str],
) -> dict:
    stem = Path(rel).stem
    module = _source_module(rel)
    addr_match = _ADDR_SUFFIX_RE.search(stem)
    addr = f"0x{addr_match.group(1).lower()}" if addr_match else None
    addr = addr or addresses.get((module, stem))
    return {"path": rel, "addr": addr, "text_size": text_sizes.get(rel)}


_ATTEMPTS_REL = Path("docs/research/campaign-analytics/attempts.tsv")
_ATTEMPT_ADDR_RE = re.compile(r"(?:^|_)([0-9a-fA-F]{8})$")


def _normalise_attempt_addr(value: str | None) -> str | None:
    """Return the canonical 0xXXXXXXXX address stored by the selector."""
    if not value:
        return None
    value = value.strip()
    match = _ATTEMPT_ADDR_RE.search(value)
    if match:
        return f"0x{match.group(1).lower()}"
    try:
        return f"0x{int(value, 0):08x}"
    except ValueError:
        return None


def _attempted_keys(path: Path | None = None) -> set[tuple[str, str]]:
    """Read the append-only ledger as (module, address) exclusion keys."""
    ledger = path or ROOT / _ATTEMPTS_REL
    if not ledger.is_file():
        return set()
    keys: set[tuple[str, str]] = set()
    with ledger.open(newline="", encoding="utf-8") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        required = {"addr", "module"}
        if not required.issubset(reader.fieldnames or []):
            raise ValueError(
                f"{ledger}: expected TSV columns including addr and module"
            )
        for row in reader:
            addr = _normalise_attempt_addr(row.get("addr"))
            module = (row.get("module") or "").strip().lower()
            if addr and module:
                keys.add((module, addr))
    return keys


def _new_module_entry() -> dict:
    return {
        "total": 0, "permanent": 0, "coercible": 0, "unknown": 0, "no_marker": 0,
        "candidate": 0, "excluded_attempted": 0,
        "coercible_files": [],  # list of {path, addr, text_size, codes}
        "unknown_files": [],  # list of {path, addr, text_size}
        "no_marker_files": [],  # list of {path, addr, text_size}
    }


def scan(
    min_size: int | None = None,
    max_size: int | None = None,
    exclude_attempted: bool = False,
) -> dict[str, dict]:
    per: dict[str, dict] = {}
    live = _live_sources()
    text_sizes = _delink_text_sizes()
    addresses = _symbol_addresses()
    attempted = _attempted_keys() if exclude_attempted else set()
    for p in (ROOT / "src").rglob("*.s"):
        rel = p.relative_to(ROOT).as_posix()
        m = _MODULE_RE.match(rel)
        if not m:
            continue
        if rel not in live:  # orphaned dead file, not a build input — skip
            continue
        metadata = _file_metadata(rel, text_sizes, addresses)
        mod = m.group(1)
        d = per.setdefault(mod, _new_module_entry())
        source_module = _source_module(rel)
        if exclude_attempted and (
            (mod, metadata["addr"]) in attempted
            or (source_module, metadata["addr"]) in attempted
        ):
            d["excluded_attempted"] += 1
            continue
        text_size = metadata["text_size"]
        if min_size is not None and (text_size is None or text_size < min_size):
            continue
        if max_size is not None and (text_size is None or text_size > max_size):
            continue
        d["total"] += 1
        c = classify_path(p)
        d[c.kind] += 1
        if c.kind == "coercible":
            d["candidate"] += 1
            d["coercible_files"].append({**metadata, "codes": c.codes})
        elif c.kind == "unknown":
            d["candidate"] += 1
            d["unknown_files"].append(metadata)
        elif c.kind == "no_marker":
            d["candidate"] += 1
            d["no_marker_files"].append(metadata)
    return per


def _json_module(d: dict) -> dict:
    # `convertible`/`convertible_files` retain the old aggregate names, but
    # each file is now structured so selectors can use the committed address
    # and `.text` span without falling back to on-disk `.s` byte counts.
    out = {k: v for k, v in d.items()}
    out["convertible"] = d["candidate"]
    out["convertible_files"] = (
        d["coercible_files"] + d["unknown_files"] + d["no_marker_files"]
    )
    return out


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description="Wall-aware readable-C headroom.")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--min", type=int, default=0,
                    help="only show modules with >= this many candidates")
    ap.add_argument("--coercible", action="store_true",
                    help="list every coercible file with its taxonomy code(s)")
    ap.add_argument("--exclude-attempted", action="store_true",
                    help="exclude (module, address) rows in attempts.tsv")
    ap.add_argument("--min-size", type=int, default=None,
                    help="only include files with `.text` span >= N bytes")
    ap.add_argument("--max-size", type=int, default=None,
                    help="only include files with `.text` span <= N bytes")
    args = ap.parse_args(argv[1:])
    if (args.min_size is not None and args.min_size < 0) or (
        args.max_size is not None and args.max_size < 0
    ):
        ap.error("size filters must be non-negative")
    if args.min_size is not None and args.max_size is not None and args.min_size > args.max_size:
        ap.error("--min-size cannot exceed --max-size")
    per = scan(args.min_size, args.max_size, args.exclude_attempted)
    ranked = sorted(per.items(), key=lambda kv: kv[1]["candidate"], reverse=True)
    total_candidate = sum(d["candidate"] for _, d in ranked)
    total_permanent = sum(d["permanent"] for _, d in ranked)
    total_coercible = sum(d["coercible"] for _, d in ranked)
    total_unknown = sum(d["unknown"] for _, d in ranked)
    total_no_marker = sum(d["no_marker"] for _, d in ranked)
    total_excluded = sum(d["excluded_attempted"] for _, d in ranked)

    if args.json:
        print(json.dumps({
            "total_candidate": total_candidate,
            "total_permanent": total_permanent,
            "total_coercible": total_coercible,
            "total_unknown": total_unknown,
            "total_no_marker": total_no_marker,
            "total_excluded_attempted": total_excluded,
            "modules": {m: _json_module(d) for m, d in ranked},
        }, indent=1))
        return 0

    if args.coercible:
        print(f"{'module':12} {'addr':12} {'text_size':>9} {'path':45} codes")
        print("-" * 90)
        for mod, d in ranked:
            for f in d["coercible_files"]:
                print(f"{mod:12} {str(f['addr']):12} {str(f['text_size']):>9} "
                      f"{f['path']:45} {', '.join(f['codes'])}")
        return 0

    print(f"{'module':12} {'total.s':>8} {'perm':>6} {'coerc':>6} "
          f"{'unk':>6} {'no-mrk':>7} {'candidate':>10}")
    print("-" * 66)
    for mod, d in ranked:
        if d["candidate"] < args.min:
            continue
        print(f"{mod:12} {d['total']:>8} {d['permanent']:>6} {d['coercible']:>6} "
              f"{d['unknown']:>6} {d['no_marker']:>7} {d['candidate']:>10}")
    print("-" * 66)
    print(f"TOTAL candidate EUR .s remaining: {total_candidate} "
          f"(coercible {total_coercible} + unknown/never-assessed {total_unknown} "
          f"+ no-marker {total_no_marker})")
    print(f"TOTAL confirmed-permanent: {total_permanent}")
    if args.exclude_attempted:
        print(f"TOTAL excluded by attempts ledger: {total_excluded}")
    print("(candidate = NOT confirmed-permanent; still an upper bound, "
          "not a work-list — header-read before compiling)")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
