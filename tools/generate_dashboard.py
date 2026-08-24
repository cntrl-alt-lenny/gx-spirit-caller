#!/usr/bin/env python3
"""
generate_dashboard.py — regenerate docs/dashboard.md, the committed
one-page status snapshot every number on which is tool-derived.

Why this exists: the brain re-derives the same handful of numbers by hand
every round (natural-C % per region, remaining pool by size band, data-
readability bytes) and pastes them into prose, where they immediately start
going stale. This tool makes the hand-derivation unnecessary by generating a
single committed page from the project's own existing metric sources —
never a new implementation of a metric that already has one.

Sources reused, not reimplemented (the standing rule from the metric-
extern-guard incident: read the metric's own source, reuse its parser):
  * `tools/progress.py`'s `c_code_total_bytes` / `c_code_bytes_by_class` —
    the SAME functions `tools/generate_state_table.py` calls for its own
    "Readable C by region" table.
  * `tools/progress.py`'s `summarize_data_readability` — the same function
    `generate_state_table.py` uses for its "EUR data typing" section.
  * `tools/wall_aware_headroom.py`'s `scan()` — the campaign's own
    wall-aware candidate-pool scanner, for the remaining-pool-by-band
    section. As of this tool's writing, PR #1534 (a proposed
    "pool-freshness" tool) has NOT merged; if it lands later, a future
    regeneration should switch to it and say so in this docstring, but
    should sanity-check its output against `scan()` directly first (that
    PR's own held-back defect: it silently narrowed its default population
    to `main` only and mis-reported the gap as staleness).
  * `tools/analyze_symbols.py` + `tools/data_worklist.py`'s
    `--include-data-readers` extension (cm-restock-carve-10) — for the
    remaining zero-reader data pool, re-derived fresh via the same
    `build_call_graph`/`rank_data_symbols` calls those waves use, not a
    copied-down figure from a research doc (every wave that trusted a
    handed-down pool count found it stale).
  * `docs/state-table.md`'s own committed git history — walked directly
    via `git show <sha>:docs/state-table.md`, parsing the SAME table format
    `generate_state_table.py` emits. No new bookkeeping file: history is
    the database.

No build, no baserom, no toolchain: every source above reads only
committed files (`config/<region>/**/delinks.txt`, `src/**/*.s`,
`docs/state-table.md`'s git history). `load_module_sections(...,
load_binaries=False)` is used explicitly so the data-pool section works
without a compiled `build/eur/build/arm9.bin` on disk.

Committed output + `--check` mirrors `generate_state_table.py`'s own
freshness-guard mechanism exactly (same pattern, not a new one): a PR
that moves the numbers and forgets to regenerate fails CI.

Usage:
    python3.13 tools/generate_dashboard.py            # rewrite docs/dashboard.md
    python3.13 tools/generate_dashboard.py --check    # exit 1 if stale
    python3.13 tools/generate_dashboard.py --stdout   # print, don't write

Exit codes:
    0   written, or --check found it current
    1   --check found it stale (regenerate and commit)
    2   usage / IO error
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import progress  # noqa: E402
from analyze_symbols import build_call_graph, load_all  # noqa: E402
from data_worklist import (  # noqa: E402
    build_size_table,
    load_module_sections,
    rank_data_symbols,
)
from next_targets import collect_matched_ranges  # noqa: E402
from wall_aware_headroom import scan  # noqa: E402

OUT = ROOT / "docs" / "dashboard.md"
STATE_TABLE_REL = "docs/state-table.md"
REGIONS = ("eur", "usa", "jpn")

# The size bands the campaign actually dispatches on (docs/state.md's own
# ceiling-boundary table, cm-main-exploit-drain-2 / -3). A 5th "≥4 bl/blx"
# axis is part of how the campaign actually filters these pools, but no
# committed, reusable tool computes a bl/blx instruction count today (only
# `.text` size — confirmed by reading wall_aware_headroom.py's own scan()
# signature and _file_metadata()); per the reuse-don't-reimplement rule,
# this dashboard does NOT invent that filter. See the band table's own
# footnote.
BANDS: tuple[tuple[str, int | None, int | None], ...] = (
    ("<=192 B", None, 192),
    ("193-256 B", 193, 256),
    ("257-320 B", 257, 320),
    ("321-384 B", 321, 384),
)


# --------------------------------------------------------------------------- #
# Headline — reuses progress.py's own readable-C parser
# --------------------------------------------------------------------------- #

def _headline_rows() -> list[tuple[str, int, float, int, float]]:
    """(region, natural_c_bytes, natural_c_pct, asm_c_bytes, decompiled_pct)
    — the exact same values `generate_state_table.py`'s own "Readable C by
    region" table renders, via the exact same two `progress.py` calls."""
    rows = []
    for region in REGIONS:
        cfg = ROOT / "config" / region
        if not cfg.is_dir():
            continue
        total = progress.c_code_total_bytes(cfg)
        split = progress.c_code_bytes_by_class(cfg)
        nat, asm = split.get("natural-c", 0), split.get("asm-c", 0)
        nat_pct = (100 * nat / total) if total else 0.0
        both_pct = (100 * (nat + asm) / total) if total else 0.0
        rows.append((region, nat, nat_pct, asm, both_pct))
    return rows


# --------------------------------------------------------------------------- #
# Trend — docs/state-table.md's own committed git history, re-parsed
# --------------------------------------------------------------------------- #

_EUR_ROW_RE = re.compile(
    r"^\|\s*eur\s*\|\s*([\d,]+)\s*\|\s*\*\*([\d.]+)%\*\*", re.MULTILINE,
)


def _run_git(*args: str) -> str:
    r = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=True)
    if r.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)} failed: {r.stderr.strip()}")
    return r.stdout


def _trend_rows(limit: int | None = None) -> list[tuple[str, str, int, float]]:
    """(short_sha, iso_date, eur_natural_c_bytes, eur_natural_c_pct) for
    every commit that touched docs/state-table.md, oldest first, parsed
    directly from that commit's own committed table text (the same format
    `generate_state_table.py` has always emitted — no new file)."""
    log = _run_git(
        "log", "--follow", "--format=%H|%as", "--", STATE_TABLE_REL,
    ).strip()
    if not log:
        return []
    commits = [line.split("|", 1) for line in log.splitlines() if line]
    commits.reverse()  # oldest first
    if limit is not None:
        commits = commits[-limit:]
    rows: list[tuple[str, str, int, float]] = []
    for sha, date in commits:
        try:
            text = _run_git("show", f"{sha}:{STATE_TABLE_REL}")
        except RuntimeError:
            continue  # file didn't exist yet at this rename-tracked commit
        m = _EUR_ROW_RE.search(text)
        if not m:
            continue
        bytes_ = int(m.group(1).replace(",", ""))
        pct = float(m.group(2))
        rows.append((sha[:9], date, bytes_, pct))
    return rows


# --------------------------------------------------------------------------- #
# Remaining pools by band — wall_aware_headroom.scan(), no new selector
# --------------------------------------------------------------------------- #

def _all_candidate_sizes() -> list[int]:
    """Every candidate's `.text` size, across every module, from ONE
    unfiltered `scan()` call. `scan()` walks the entire `src/` tree and
    reads every `.s` file's content for wall-marker classification --
    expensive (seconds, real disk I/O) -- so this is called once and the
    four size bands below are bucketed from its result in pure Python,
    rather than re-scanning per band. `--exclude-attempted` matches how
    the campaign actually measures dispatchable headroom (docs/state.md's
    own usage)."""
    per = scan(None, None, True, None, None)
    return [
        f["text_size"] or 0
        for d in per.values()
        for key in ("coercible_files", "unknown_files", "no_marker_files")
        for f in d[key]
    ]


def _band_totals(sizes: list[int], min_size: int | None, max_size: int | None) -> tuple[int, int]:
    """(candidate_count, candidate_bytes) for one size band, bucketed from
    the single `_all_candidate_sizes()` pass."""
    lo = min_size if min_size is not None else 0
    hi = max_size if max_size is not None else float("inf")
    in_band = [s for s in sizes if lo <= s <= hi]
    return len(in_band), sum(in_band)


# --------------------------------------------------------------------------- #
# Remaining zero-reader data pool — cm-restock-carve-10's extension,
# re-derived fresh (not a copied-down figure).
# --------------------------------------------------------------------------- #

def _zero_reader_pool(config_dir: Path, version: str) -> tuple[int, int]:
    """(symbol_count, byte_total) for `main` data/bss symbols with ZERO
    readers under the extended graph (neither a function nor a data
    pointer table references them) — the residual
    `cm-restock-carve-10`/`-11` found genuinely unexplained, re-measured
    fresh here rather than quoting that wave's own number forward.

    `load_binaries=False`: this only needs section RANGES (for the
    next-symbol-gap size deduction), never byte CONTENT, so it works with
    no `build/` directory on disk -- this dashboard needs no ROM build.
    """
    modules = load_all(config_dir)
    modsecs_map = load_module_sections(config_dir, version, load_binaries=False)
    size_table = build_size_table(modules, modsecs_map)

    def data_size_of(s):
        return size_table.get((s.module, s.addr), s.size)

    graph = build_call_graph(modules, data_size_of=data_size_of)
    matched = collect_matched_ranges(config_dir)
    entries = rank_data_symbols(
        modules, graph, matched, min_readers=0, module_filter="main",
        modsecs_map=modsecs_map, size_table=size_table,
        include_data_readers=True,
    )
    zero = [e for e in entries if e.total_reader_count == 0]
    return len(zero), sum(e.effective_size for e in zero)


# --------------------------------------------------------------------------- #
# Render
# --------------------------------------------------------------------------- #

def render() -> str:
    lines: list[str] = []
    add = lines.append
    add("<!-- GENERATED by tools/generate_dashboard.py -- do not edit by hand. -->")
    add("<!-- Regenerate after any merge that moves the numbers; `--check` gates it. -->")
    add("")
    add("# Project dashboard")
    add("")
    add("One page, every number reproducible by the command named next to it.")
    add("No hand-derivation: every figure below comes from a function this")
    add("project already trusts elsewhere, never a new implementation of a")
    add("metric that already has one. No ROM build is required to regenerate")
    add("this page.")
    add("")

    # ---- Headline ----
    add("## Headline: natural-C by region")
    add("")
    add("Reproduce: `python -c \"import sys; sys.path.insert(0,'tools'); "
        "import progress; from pathlib import Path; "
        "print(progress.c_code_bytes_by_class(Path('config/eur')))\"` "
        "(same call `tools/generate_state_table.py` makes for each region).")
    add("")
    add("| region | natural-C | natural-C % | asm-C | C-decompiled % |")
    add("| --- | ---: | ---: | ---: | ---: |")
    for region, nat, nat_pct, asm, both_pct in _headline_rows():
        add(f"| {region} | {nat:,} | **{nat_pct:.2f}%** | {asm:,} | {both_pct:.2f}% |")
    add("")

    # ---- Trend ----
    add("## Trend: EUR natural-C over time")
    add("")
    add(f"Reproduce: `git log --follow --format=%H -- {STATE_TABLE_REL}` then "
        f"`git show <sha>:{STATE_TABLE_REL}` per commit -- the committed table's "
        "own git history IS the time series; no separate bookkeeping file.")
    add("")
    trend = _trend_rows()
    if not trend:
        add("_No history yet (docs/state-table.md has no commits, or was just added)._")
        add("")
    else:
        add("| commit | date | EUR natural-C | EUR natural-C % | Δ bytes |")
        add("| --- | --- | ---: | ---: | ---: |")
        prev_bytes: int | None = None
        for sha, date, nat_bytes, nat_pct in trend:
            delta = "" if prev_bytes is None else f"{nat_bytes - prev_bytes:+,}"
            add(f"| `{sha}` | {date} | {nat_bytes:,} | {nat_pct:.2f}% | {delta} |")
            prev_bytes = nat_bytes
        add("")
        add(f"{len(trend)} points, one per commit that changed "
            f"`{STATE_TABLE_REL}` (oldest first).")
        add("")

    # ---- Remaining pools by band ----
    add("## Remaining candidate pools by size band (EUR, `.text`)")
    add("")
    add("**These are NOT the dispatch-ready pools -- read this before the "
        "table.** The campaign dispatches on `.text` size AND a "
        "branch-link (>=4 `bl`/`blx` instructions) filter together; no "
        "committed, reusable tool computes the `bl`/`blx` count today "
        "(`wall_aware_headroom."
        "scan()` filters only by `.text` size and address -- confirmed by "
        "reading its own CLI), so the table below applies the size half "
        "only. That halves-the-story gap is large: `docs/state.md` hand-"
        "measured the `bl`-filtered `<=192 B` pool at **34 candidates / "
        "5,224 B**, roughly 3% of this table's size-only `<=192 B` row. "
        "Per the reuse-don't-reimplement rule this page does not invent "
        "a `bl`-counting tool to close that gap; see `docs/state.md` for "
        "the hand-verified dispatch figures until one is committed, and "
        "`PR #1534` (unmerged as of this page) for the proposed "
        "direction -- sanity-check its output against `scan()` directly "
        "before trusting it, per that PR's own held-back defect (a "
        "silently `main`-only default population reported as staleness).")
    add("")
    add("Reproduce per row: `python tools/wall_aware_headroom.py "
        "--exclude-attempted --min-size <lo> --max-size <hi> --json` "
        "(this table sums every module's `candidate` count and each "
        "candidate file's own `text_size`).")
    add("")
    add("| band | candidates (size-only) | bytes (size-only) |")
    add("| --- | ---: | ---: |")
    all_sizes = _all_candidate_sizes()
    for label, lo, hi in BANDS:
        count, band_bytes = _band_totals(all_sizes, lo, hi)
        add(f"| {label} | {count:,} | {band_bytes:,} |")
    add("")

    # ---- Data readability ----
    eur = ROOT / "config" / "eur"
    add("## Data readability (EUR)")
    add("")
    add("Reproduce: `python -c \"import sys; sys.path.insert(0,'tools'); "
        "import progress; from pathlib import Path; "
        "print(progress.summarize_data_readability(Path('config/eur')))\"` "
        "(same call `tools/generate_state_table.py` makes).")
    add("")
    data = progress.summarize_data_readability(eur)
    total_data = data.get("data_total_bytes") or 0
    add("| metric | bytes | of data bytes |")
    add("| --- | ---: | ---: |")
    for key, label in (("typed_array_bytes", "Typed-array"),
                       ("named_struct_bytes", "Named-struct")):
        v = data.get(key) or 0
        pct = (100 * v / total_data) if total_data else 0.0
        add(f"| {label} | {v:,} | {pct:.2f}% |")
    add(f"| *(total data bytes)* | {total_data:,} | |")
    add("")
    zero_n, zero_bytes = _zero_reader_pool(eur, "eur")
    add(f"Remaining zero-reader data pool (`main`, re-derived fresh via "
        f"`data_worklist.py --include-data-readers`, not copied from a "
        f"prior wave's writeup): **{zero_n:,} symbols / {zero_bytes:,} "
        f"bytes** with no function reader AND no data-pointer-table "
        f"reader under the extended call graph "
        f"(`cm-restock-carve-10`'s `edges_load_from_data`).")
    add("")

    # ---- Honest ceiling ----
    add("## The honest ceiling")
    add("")
    add("This dashboard reports progress, not a forecast -- two standing "
        "documents carry the calibration on top of it:")
    add("")
    add("- [`rnd-swarm-2026-07-24-r8.md`](research/rnd-swarm-2026-07-24-r8.md) "
        "-- found the published tractable ceiling was a two-module policy "
        "artifact (`ASYMPTOTIC_MODULES` frozen at a 0.10 headroom "
        "fraction for `main`/`ov002`, 78.3% of the denominator), not a "
        "measured limit.")
    add("- [`post-small-pool-strategy.md`](research/post-small-pool-strategy.md) "
        "-- the decision memo for what happens once the current small-"
        "function pool (the size bands above) is exhausted; keyed to a "
        "falsification test, not a hope.")
    add("")
    add("Read both before treating any single round's delta as trend.")
    add("")

    return "\n".join(lines) + "\n"


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="Regenerate docs/dashboard.md.")
    ap.add_argument("--check", action="store_true",
                    help="exit 1 if the committed dashboard is stale")
    ap.add_argument("--stdout", action="store_true", help="print instead of writing")
    args = ap.parse_args(argv)

    # render() re-derives several genuinely expensive metrics (a full
    # wall_aware_headroom.scan() of src/**/*.s, a data-symbol call-graph
    # walk, 40+ `git show` calls for the trend) -- tens of seconds. Check
    # the cheap "file missing" case first so --check doesn't pay that cost
    # just to report something render() was never needed to know.
    if args.check and not OUT.is_file():
        print(f"{OUT} is missing. Run `python tools/generate_dashboard.py`.",
              file=sys.stderr)
        return 1

    try:
        text = render()
    except Exception as exc:  # noqa: BLE001 - report, don't half-write
        print(f"generate_dashboard: could not derive dashboard: {exc}", file=sys.stderr)
        return 2

    if args.stdout:
        print(text, end="")
        return 0

    if args.check:
        if OUT.read_text(encoding="utf-8") != text:
            print(f"{OUT} is out of date. Re-run "
                  f"`python tools/generate_dashboard.py` and commit.", file=sys.stderr)
            return 1
        print(f"{OUT} is current.")
        return 0

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(text, encoding="utf-8")
    print(f"wrote {OUT.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
