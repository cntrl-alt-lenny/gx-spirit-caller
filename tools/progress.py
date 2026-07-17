#!/usr/bin/env python3

"""
Reports decomp progress for Yu-Gi-Oh! GX Spirit Caller.

Three sources, in order of preference (descending fidelity):

  1. build/<version>/report.json produced by `ninja report`
     (i.e. `objdiff-cli report generate`). Post-decomp + post-build, this
     is the source of truth — reports matched code %, matched data %,
     complete-unit counts, etc. Requires the full toolchain to generate.

  2. config/<version>/**/delinks.txt produced by `dsd init` + hand-carved
     TU headers. Sums the byte ranges of TUs marked `complete` as matched
     code/data, against the module section maps as totals. No build
     required — works in CI where the baserom and toolchain aren't
     available. A "complete" TU in delinks is a strong signal that
     objdiff agrees the bytes match (that's what the decomper types in
     once they verify 100% match).

  3. config/<version>/**/symbols.txt — the list of every known symbol.
     Pre-carve fallback: just counts function entries so the denominator
     is non-zero. Matched is always 0 here. Used only when neither
     report.json nor any TU-carved delinks.txt exists.

All three produce the same top-level shape when `--json` is passed so
downstream tools (update_progress_badge.py, generate_heatmap.py) don't
need to know which source was used.
"""

import argparse
import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent

# Section classifications for the delinks.txt tier. Matches objdiff's
# own categorisation (.text + .init count as code; everything else that
# carries actual bytes counts as data).
CODE_SECTIONS = {".text", ".init"}
DATA_SECTIONS = {".data", ".rodata", ".ctor", ".dtor", ".bss"}


def count_functions_in_symbols(symbols_file: Path) -> int:
    """Count how many symbols in a dsd symbols.txt file are functions.

    ds-decomp's symbols.txt uses a 'kind:function' field per line; if the
    schema changes this heuristic will under/over-count, which is fine for
    a 0% stub — replace with the real parser when it matters.
    """
    count = 0
    try:
        with symbols_file.open() as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                # Match both "kind:function" and "function" as token.
                if "kind:function" in line or " function " in f" {line} ":
                    count += 1
    except OSError:
        pass
    return count


def count_total_functions(config_dir: Path) -> int:
    total = 0
    for symbols in config_dir.rglob("symbols.txt"):
        total += count_functions_in_symbols(symbols)
    return total


# --------------------------------------------------------------------------- #
# delinks.txt tier
# --------------------------------------------------------------------------- #

def parse_delinks_file(delinks_file: Path) -> tuple[list[tuple[str, int, int]], list[dict]]:
    """Parse a dsd-produced delinks.txt.

    Returns a tuple `(module_sections, tus)`:

      module_sections: list of (section_name, start, end) tuples for the
        module-wide section map at the top of the file — the
        authoritative byte-range totals for this module.

      tus: list of TU dicts, each
          {"source": "src/...c" or "_dsd_gap@...",
           "status": "complete" | None,
           "sections": [(name, start, end), ...]}

    File layout:

        .text       start:0x... end:0x... kind:code align:32   <-- module map
        .rodata     start:...                                  <-- module map
        ...                                                    <-- blank line
        src/path/foo.c:                                        <-- TU header
            complete                                           <-- optional
            .text start:0x... end:0x...                        <-- section
        _dsd_gap@mod_N:                                        <-- gap TU
            .text start:...
    """
    module_sections: list[tuple[str, int, int]] = []
    tus: list[dict] = []
    current_tu: dict | None = None
    in_tu_section = False  # False while we're still in the leading module map

    if not delinks_file.is_file():
        return module_sections, tus

    try:
        with delinks_file.open() as f:
            for raw in f:
                line = raw.rstrip()
                stripped = line.strip()
                if not stripped or stripped.startswith("#"):
                    continue

                # TU header: `src/...:` or `_dsd_gap@...:`
                if stripped.endswith(":") and not stripped.startswith("."):
                    if current_tu is not None:
                        tus.append(current_tu)
                    current_tu = {
                        "source": stripped.rstrip(":"),
                        "status": None,
                        "sections": [],
                    }
                    in_tu_section = True
                    continue

                # Status line: `complete` (or other bare keyword). Only
                # meaningful once we're inside a TU.
                if in_tu_section and current_tu is not None and \
                   stripped in ("complete", "incomplete"):
                    current_tu["status"] = stripped
                    continue

                # Section line: starts with a dot.
                if stripped.startswith("."):
                    parts = stripped.split()
                    section_name = parts[0]
                    start = end = None
                    for p in parts[1:]:
                        if p.startswith("start:0x"):
                            start = int(p[len("start:0x"):], 16)
                        elif p.startswith("end:0x"):
                            end = int(p[len("end:0x"):], 16)
                    if start is None or end is None:
                        continue
                    if in_tu_section and current_tu is not None:
                        current_tu["sections"].append((section_name, start, end))
                    else:
                        module_sections.append((section_name, start, end))
                    continue
                # Any other line (unrecognised): leave TU context alone.
        if current_tu is not None:
            tus.append(current_tu)
    except OSError:
        pass
    return module_sections, tus


def c_code_bytes(config_dir: Path, *, require_complete: bool = False) -> int:
    """Sum of `.text` bytes for TUs sourced from a `.c`/`.cpp` file (never
    `.s`) across every `config_dir/**/delinks.txt`.

    This is the metric `matched_code` (above) and `complete_units` CANNOT
    give you: both of those count a `.s` ship (a byte-identical assembly
    escape hatch, never hand-decompiled) identically to a real C match —
    see the improvement-swarm r3 report's REFRAME finding. `c_code_bytes`
    is the true "readable C" numerator; pair it against
    `c_code_total_bytes`'s `.text`-only denominator for the % line (NOT
    `summarize_delinks`'s `total_code`, which also includes `.init` —
    see `c_code_total_bytes`'s docstring for why that mismatch matters).

    Pass `require_complete=True` for the stricter "verified byte-
    matching only" view (gates on `status == "complete"`, the same
    status `summarize_delinks` requires for `matched_code`). The
    default (`False`) counts any `.c`/`.cpp`-sourced TU regardless of
    match state — an in-progress draft is still real C on disk,
    arguably readable, just not yet byte-verified.

    No build required — same delinks.txt-only data source as
    `summarize_delinks`. Originally lived in `generate_progress_bars.py`
    (which now imports it from here) — moved to `progress.py` so the
    headline text/JSON reporter can carry the same honest number, not
    just the SVG badge.

    Uses the canonical `parse_delinks_file` (brief 566 / improvement-
    swarm r4 A3) rather than a bespoke regex scan — the earlier regex
    tracked "current TU's source extension" as a variable that
    persisted across TU boundaries, so a `_dsd_gap@...` TU immediately
    following a `.c`/`.cpp` TU had its `.text` bytes silently
    misattributed to C (gap TU headers never match the src/libs regex,
    so the leaked `ext` value was never reset). Iterating `tus` gives
    each TU its own correctly-scoped `source` field, eliminating that
    leak by construction.
    """
    total = 0
    for delinks in config_dir.rglob("delinks.txt"):
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if not (source.endswith(".c") or source.endswith(".cpp")):
                continue
            if require_complete and tu.get("status") != "complete":
                continue
            for name, start, end in tu.get("sections", []):
                if name == ".text":
                    total += max(0, end - start)
    return total


def c_code_total_bytes(config_dir: Path) -> int:
    """Sum of `.text`-only bytes from the MODULE-LEVEL section map
    across every `config_dir/**/delinks.txt` — the correct denominator
    for `c_code_bytes()`'s ratio (brief 566 / improvement-swarm r4 A3).

    `summarize_delinks`'s `total_code` sums `.text` + `.init`
    (`CODE_SECTIONS`), which is right for the "byte-matched" line
    (`.init` genuinely is code, and a `.s` or `.c` TU can occupy
    either section). But `c_code_bytes()`'s numerator only ever scans
    `.text` ranges — even for a `.c`/`.cpp` TU that also owns `.init`
    bytes (e.g. `sinit_*.c` static-initializer glue) — so pairing that
    numerator against a `.text`+`.init` denominator means the ratio
    can never reach 100% even at full decomp: it's structurally capped
    at `1 - init_bytes/total_code` (~99.907% for EUR at the time of
    writing). This function gives the `.text`-only total so both sides
    of the ratio count exactly the same section set.
    """
    total = 0
    for delinks in config_dir.rglob("delinks.txt"):
        module_sections, _tus = parse_delinks_file(delinks)
        for name, start, end in module_sections:
            if name == ".text":
                total += max(0, end - start)
    return total


def summarize_delinks(config_dir: Path) -> dict | None:
    """Walk every config/<ver>/**/delinks.txt and aggregate byte totals
    into a report.json-shaped dict. Returns None if no delinks.txt
    files are found.

    Totals come from the module section maps (authoritative). Matched
    sums sections from TUs whose status is `complete`.
    """
    all_delinks = list(config_dir.rglob("delinks.txt"))
    if not all_delinks:
        return None

    matched_code = total_code = matched_data = total_data = 0
    matched_units = total_units = 0

    for delinks in all_delinks:
        module_sections, tus = parse_delinks_file(delinks)

        # Totals — from the module-level section map.
        for name, start, end in module_sections:
            size = max(0, end - start)
            if name in CODE_SECTIONS:
                total_code += size
            elif name in DATA_SECTIONS:
                total_data += size

        # Matched — from TUs with status=complete. Gap entries
        # (`_dsd_gap@...`) are uncarved TUs that count toward the
        # denominator (they're chunks to eventually match) but never
        # toward matched (status=complete is typed by the decomper once
        # objdiff agrees).
        for tu in tus:
            total_units += 1
            if tu.get("source", "").startswith("_dsd_gap"):
                continue
            if tu.get("status") != "complete":
                continue
            matched_units += 1
            for name, start, end in tu.get("sections", []):
                size = max(0, end - start)
                if name in CODE_SECTIONS:
                    matched_code += size
                elif name in DATA_SECTIONS:
                    matched_data += size

    return {
        "source": "delinks",
        "measures": {
            # Match report.json's str-bytes convention for values that
            # could overflow JS safe-int range in downstream tooling.
            "matched_code":    str(matched_code),
            "total_code":      str(total_code),
            "matched_data":    str(matched_data),
            "total_data":      str(total_data),
            "complete_units":  matched_units,
            "total_units":     total_units,
        },
    }


# --------------------------------------------------------------------------- #
# Per-module breakdown (brief 587 / improvement-swarm r5)
# --------------------------------------------------------------------------- #

def _discover_module_delinks(config_dir: Path) -> list[tuple[str, Path]]:
    """[(module_name, delinks_path)] in main/itcm/dtcm/ovNNN order.

    Deliberately a small local walk rather than importing calcrom.py's
    own `discover_module_paths` (which additionally requires a sibling
    relocs.txt this function doesn't need): progress.py is the
    dependency root other tools import FROM (see `c_code_bytes`'s
    docstring and improvement-swarm r4 A3), not the reverse — pulling
    from calcrom here would invert that and risk a circular import if
    calcrom ever imports something from progress (it already sources
    its own `measures` from `summarize_delinks`, per r4's structural-fix
    note).
    """
    arm9 = config_dir / "arm9"
    out: list[tuple[str, Path]] = []
    if not arm9.is_dir():
        return out
    main_delinks = arm9 / "delinks.txt"
    if main_delinks.is_file():
        out.append(("main", main_delinks))
    for name in ("itcm", "dtcm"):
        d = arm9 / name / "delinks.txt"
        if d.is_file():
            out.append((name, d))
    ov_root = arm9 / "overlays"
    if ov_root.is_dir():
        for sub in sorted(ov_root.iterdir()):
            if sub.is_dir() and sub.name.startswith("ov"):
                d = sub / "delinks.txt"
                if d.is_file():
                    out.append((sub.name, d))
    return out


def summarize_by_module(config_dir: Path) -> list[dict]:
    """Per-module code% (`matched_code`/`total_code`, `CODE_SECTIONS`)
    AND C% (`.text`-only, `.c`/`.cpp`-sourced `complete` TUs over
    `.text`-only total — the same ratio `c_code_bytes`/
    `c_code_total_bytes` already report region-wide, brief 566 /
    improvement-swarm r4 A3) — broken out per module instead of summed
    across the whole region. Reuses `parse_delinks_file`; build-free
    (no report.json needed).

    No tool previously reported C% per module at all (improvement-swarm
    r5): 78.3% of EUR's denominator is 2 modules (arm9 + ov002) sitting
    at 6.58% combined C, capping the *headline* number at 26.89% even if
    every OTHER module hit 100% C — invisible without this breakdown.

    Returns one dict per module, in discovery order (main, itcm, dtcm,
    ov000..ovNNN):
        {"module": str, "matched_code": int, "total_code": int,
         "c_bytes": int, "c_total": int}
    Raw byte counts, not percentages — callers compute the ratio (JSON
    payloads should carry the same values report.json's `measures` do,
    not a lossy pre-divided float).
    """
    rows: list[dict] = []
    for module, delinks in _discover_module_delinks(config_dir):
        module_sections, tus = parse_delinks_file(delinks)

        total_code = matched_code = 0
        c_total = 0
        for name, start, end in module_sections:
            size = max(0, end - start)
            if name in CODE_SECTIONS:
                total_code += size
            if name == ".text":
                c_total += size

        c_bytes = 0
        for tu in tus:
            source = tu.get("source", "")
            is_gap = source.startswith("_dsd_gap")
            complete = tu.get("status") == "complete"
            for name, start, end in tu.get("sections", []):
                size = max(0, end - start)
                if not is_gap and complete and name in CODE_SECTIONS:
                    matched_code += size
                if complete and name == ".text" and (
                    source.endswith(".c") or source.endswith(".cpp")):
                    c_bytes += size

        rows.append({
            "module": module,
            "matched_code": matched_code, "total_code": total_code,
            "c_bytes": c_bytes, "c_total": c_total,
        })
    return rows


def print_by_module(version: str, rows: list[dict]) -> None:
    def pct(num: int, den: int) -> float:
        return (num / den * 100.0) if den else 0.0

    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — per-module code% / C%")
    print()
    hdr = (f"  {'module':<8} {'code %':>7}  {'matched/total code (B)':>24}  "
           f"{'C %':>7}  {'C / .text-total (B)':>22}")
    print(hdr)
    print("  " + "-" * (len(hdr) - 2))
    tot_matched = tot_total = tot_c = tot_ctotal = 0
    for row in rows:
        code_frac = f"{row['matched_code']}/{row['total_code']}"
        c_frac = f"{row['c_bytes']}/{row['c_total']}"
        print(f"  {row['module']:<8} {pct(row['matched_code'], row['total_code']):6.2f}%  "
              f"{code_frac:>24}  {pct(row['c_bytes'], row['c_total']):6.2f}%  {c_frac:>22}")
        tot_matched += row["matched_code"]; tot_total += row["total_code"]
        tot_c += row["c_bytes"]; tot_ctotal += row["c_total"]
    print("  " + "-" * (len(hdr) - 2))
    tot_code_frac = f"{tot_matched}/{tot_total}"
    tot_c_frac = f"{tot_c}/{tot_ctotal}"
    print(f"  {'TOTAL':<8} {pct(tot_matched, tot_total):6.2f}%  "
          f"{tot_code_frac:>24}  {pct(tot_c, tot_ctotal):6.2f}%  {tot_c_frac:>22}")


def print_stub(version: str, total: int) -> None:
    if total == 0:
        print(f"{version}: no symbols.txt files found yet.")
        print("  run: python tools/configure.py <version> && ninja delink")
        return
    pct = 0.0
    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — decomp progress")
    print()
    print(f"  functions matched:  0 / {total}  ({pct:5.2f}%)")
    print("  data matched:       (no report yet)")
    print()
    print("  Run `ninja report` after compiling any source to produce a real report.")


def print_report(version: str, report: dict, config_dir: Path | None = None) -> None:
    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — decomp progress")
    print()
    measures = report.get("measures", {})

    def pct(matched, total):
        return (matched / total * 100.0) if total else 0.0

    # objdiff v2.7+ emits byte totals as strings (values exceed JS safe-int range).
    def as_int(v) -> int:
        return int(v) if v is not None else 0

    code_matched = as_int(measures.get("matched_code"))
    code_total   = as_int(measures.get("total_code"))
    data_matched = as_int(measures.get("matched_data"))
    data_total   = as_int(measures.get("total_data"))
    units_done   = as_int(measures.get("complete_units"))
    units_total  = as_int(measures.get("total_units"))

    print(f"  code:   {code_matched:>10} / {code_total:<10} bytes  ({pct(code_matched, code_total):5.2f}%)")
    print(f"  data:   {data_matched:>10} / {data_total:<10} bytes  ({pct(data_matched, data_total):5.2f}%)")
    print(f"  units:  {units_done:>10} / {units_total:<10}        ({pct(units_done, units_total):5.2f}%)")
    # 4th line (improvement-swarm r3 REFRAME): code/data/units above all
    # count a `.s` ship identically to a real C match, so none of them
    # can see the "readable C" goal. c_code_bytes is the true numerator.
    # Denominator is c_code_total_bytes (`.text`-only), NOT code_total
    # (`.text`+`.init`) — pairing the .text-only numerator against a
    # .text+.init denominator structurally caps the ratio below 100%
    # even at full decomp (brief 566 / improvement-swarm r4 A3).
    if config_dir is not None:
        c_matched = c_code_bytes(config_dir)
        c_total = c_code_total_bytes(config_dir)
        print(f"  C-decompiled: {c_matched:>10} / {c_total:<10} bytes  "
              f"({pct(c_matched, c_total):5.2f}%)  <- true readable-C metric, "
              f"distinct from 'code' above (which also counts .s ships)")
    print()

    if report.get("categories"):
        print("  by category:")
        for cat in report["categories"]:
            name = cat.get("name", "?")
            m = cat.get("measures", {})
            print(f"    {name:<20} code {pct(as_int(m.get('matched_code')), as_int(m.get('total_code'))):5.2f}%   "
                  f"data {pct(as_int(m.get('matched_data')), as_int(m.get('total_data'))):5.2f}%")


def main() -> int:
    ap = argparse.ArgumentParser(description="Report decomp progress")
    ap.add_argument("--version", default="usa", help='Game version (default: "usa")')
    ap.add_argument("--json", action="store_true", help="Emit machine-readable JSON")
    ap.add_argument("--by-module", action="store_true",
                    help="Per-module code%% AND C%% table (build-free, "
                         "delinks.txt tier only — brief 587)")
    args = ap.parse_args()

    report_path = ROOT / "build" / args.version / "report.json"
    config_dir  = ROOT / "config" / args.version

    if args.by_module:
        rows = summarize_by_module(config_dir)
        if not rows:
            print(f"error: no config under config/{args.version} (wrong region?)",
                  file=sys.stderr)
            return 1
        if args.json:
            json.dump({"version": args.version, "modules": rows}, sys.stdout, indent=2)
            print()
        else:
            print_by_module(args.version, rows)
        return 0

    # Tier 1 — objdiff-generated report.json. Highest fidelity; requires
    # a post-`ninja report` local build.
    if report_path.is_file():
        with report_path.open() as f:
            report = json.load(f)
        if args.json:
            payload = dict(report)
            payload["c_code_bytes"] = c_code_bytes(config_dir)
            payload["c_code_total_bytes"] = c_code_total_bytes(config_dir)
            json.dump(payload, sys.stdout, indent=2)
            print()
        else:
            print_report(args.version, report, config_dir)
        return 0

    # Tier 2 — delinks.txt-derived summary. Works in CI (no toolchain
    # or baserom needed); counts bytes in TUs the decomper has marked
    # `complete`. Approximate but correct-directional.
    delinks_summary = summarize_delinks(config_dir)
    if delinks_summary is not None and delinks_summary["measures"]["total_units"]:
        if args.json:
            # Merge a `state: delinks` tag so downstream tools can see
            # the provenance without changing their measures-reading code.
            payload = {"version": args.version, "state": "delinks",
                       "c_code_bytes": c_code_bytes(config_dir),
                       "c_code_total_bytes": c_code_total_bytes(config_dir),
                       **delinks_summary}
            json.dump(payload, sys.stdout, indent=2)
            print()
        else:
            print_report(args.version, delinks_summary, config_dir)
            print("  source: delinks.txt (approximate — run `ninja report` locally "
                  "for objdiff-verified numbers)")
        return 0

    # Tier 3 — pre-carve stub. Only runs when there is no delinks.txt
    # TU graph yet. Matched is always 0; just shows the denominator so
    # the badge says 0.00% of N functions instead of 0.00% of nothing.
    total = count_total_functions(config_dir)
    if args.json:
        json.dump({
            "version": args.version,
            "state": "stub",
            "total_functions": total,
            "matched_functions": 0,
        }, sys.stdout, indent=2)
        print()
    else:
        print_stub(args.version, total)
    return 0


if __name__ == "__main__":
    sys.exit(main())
