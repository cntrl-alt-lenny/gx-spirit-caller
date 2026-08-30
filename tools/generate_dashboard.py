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
    ("385+ B", 385, None),
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

# Matches one rendered trend-table row: `| `sha` | date | bytes | pct% | delta |`
# (delta is blank for the first row -- `[^|]*` accepts that). Group 1 is the
# SHA; groups 2-5 are everything the trailing-row tolerance below still
# requires to match exactly.
_TREND_ROW_RE = re.compile(
    r"^\| `([0-9a-fA-F]+)` \| (\S+) \| ([\d,]+) \| ([\d.]+)% \| ([^|]*) \|$",
    re.MULTILINE,
)

# The trend table's own point-count summary line -- the one other line that
# a trailing-row ADDITION (see _dashboard_is_current's second tolerance
# branch below) legitimately changes, since it's a bare `len(trend)`.
_POINTS_LINE_RE = re.compile(
    rf"^(\d+) points, one per commit that changed "
    rf"`{re.escape(STATE_TABLE_REL)}` \(oldest first\)\.$",
    re.MULTILINE,
)


def _run_git(*args: str) -> str:
    r = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=True)
    if r.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)} failed: {r.stderr.strip()}")
    return r.stdout


# --------------------------------------------------------------------------- #
# Trailing-row SHA tolerance (q-derived-artifact-selfreference)
# --------------------------------------------------------------------------- #
#
# The trend table's LAST row cites the commit SHA of the most recent commit
# that touched docs/state-table.md -- almost always the very commit this PR
# is introducing. Squash-merging that PR gives it a BRAND NEW SHA that
# nothing on the branch could have predicted at generation time, so the very
# next `--check` (in CI right after merge, or a later round's regeneration)
# sees a real, derived mismatch on exactly that one cell -- staleness that
# is unsatisfiable to avoid by sequencing commits differently, because the
# rewrite happens outside the PR entirely, at merge time.
#
# `_dashboard_is_current` tolerates ONLY this specific, single-cell drift:
# the trailing trend row's SHA column may differ between the committed file
# and a fresh render, and nothing else may. Every other row's SHA, and the
# trailing row's own date/bytes/pct/delta, are still compared exactly --
# real staleness (a moved number, a missing section, any non-trailing SHA)
# still fails `--check` immediately, exactly as before this change.


def _dashboard_is_current(committed: str, fresh: str) -> tuple[bool, str]:
    """Compare a committed dashboard against a freshly-rendered one.

    Returns (is_current, detail) -- `detail` is a human-readable reason
    either way. Tolerates exactly two narrow, documented self-reference
    patterns, both scoped to the trend table specifically (see module note
    above and _check_trailing_row_addition's own note below):
      1. Same line count: the trailing trend row's SHA column differs and
         nothing else does (a squash-merge rewrite).
      2. Fresh has exactly one more line: one new trend row was appended
         at the end, and the point-count summary line bumped to match --
         nothing else differs.
    Any other difference -- more than one line changed (case 1), more or
    fewer than one line added (case 2), a non-trailing row, a non-SHA
    field of the trailing row, a moved/changed row anywhere else -- is
    real staleness and returns `is_current=False`.
    """
    if committed == fresh:
        return True, "exact match"

    committed_lines = committed.splitlines(keepends=True)
    fresh_lines = fresh.splitlines(keepends=True)

    if len(committed_lines) == len(fresh_lines):
        return _check_trailing_sha_rewrite(committed_lines, fresh_lines, fresh)
    if len(fresh_lines) == len(committed_lines) + 1:
        return _check_trailing_row_addition(committed_lines, fresh_lines)
    return False, "stale (line count differs)"


def _check_trailing_sha_rewrite(
    committed_lines: list[str], fresh_lines: list[str], fresh: str,
) -> tuple[bool, str]:
    """Case 1: tolerates AT MOST one differing line, and only if that line
    is the trend table's trailing row differing solely in its SHA column."""
    diffs = [i for i, (c, f) in enumerate(zip(committed_lines, fresh_lines, strict=True))
             if c != f]
    if len(diffs) != 1:
        return False, f"stale ({len(diffs)} line(s) differ)"

    c_line = committed_lines[diffs[0]].rstrip("\n")
    f_line = fresh_lines[diffs[0]].rstrip("\n")
    c_m = _TREND_ROW_RE.match(c_line)
    f_m = _TREND_ROW_RE.match(f_line)
    if not (c_m and f_m):
        return False, "stale (the differing line is not a trend-table row)"
    if c_m.groups()[1:] != f_m.groups()[1:]:
        return False, "stale (trend row content beyond the SHA differs)"
    if c_m.group(1) == f_m.group(1):
        return False, "stale (line text differs but the SHA is identical)"

    # Must be the LAST trend row in the fresh render, not a middle one --
    # a middle row's SHA is already-merged history and should never drift.
    fresh_trend_rows = _TREND_ROW_RE.findall(fresh)
    if not fresh_trend_rows or fresh_trend_rows[-1] != f_m.groups():
        return False, "stale (differing row is not the trend table's trailing row)"

    return True, (
        f"current except the trend table's trailing-row commit SHA "
        f"(committed `{c_m.group(1)}`, fresh `{f_m.group(1)}`) -- expected "
        f"when a squash-merge rewrites the most recent commit touching "
        f"docs/state-table.md after this file was generated; not staleness. "
        f"Re-run `python tools/generate_dashboard.py` on the next regeneration "
        f"to pick up the settled SHA."
    )


# --------------------------------------------------------------------------- #
# Trailing-row ADDITION tolerance (q-wall-overblock-audit) -- the SAME
# self-reference as above, in its OTHER form. PR #1593's tolerance only
# covered a squash-merge REWRITING the trailing row's SHA; it did not cover
# a genuinely NEW commit landing on docs/state-table.md between generation
# and `--check` (e.g. a separate PR merging first), which appends a whole
# new trailing row rather than just changing one cell -- a real, additional
# line the same self-reference problem produces, first hit when the round
# 0831 brain PR added a trend row after this file had already been
# generated. Tolerates EXACTLY one new trend-table row, appended at the
# table's end, plus the one point-count summary line it must legitimately
# also change -- nothing else may differ, so a moved/edited historical row,
# more than one new row, or any other section changing still fails closed.
# --------------------------------------------------------------------------- #


def _check_trailing_row_addition(
    committed_lines: list[str], fresh_lines: list[str],
) -> tuple[bool, str]:
    """Case 2: `fresh_lines` has exactly one more line than
    `committed_lines` (caller-checked). Walk both line lists in lockstep;
    at each divergence, accept ONLY a new trend-table row in `fresh` (skip
    it, advance fresh alone) or the point-count summary line bumping by
    exactly the number of new rows seen so far (advance both) -- any other
    divergence fails closed."""
    i = j = 0
    new_rows: list[str] = []
    points_bumped = False
    while i < len(committed_lines) and j < len(fresh_lines):
        c_line, f_line = committed_lines[i], fresh_lines[j]
        if c_line == f_line:
            i += 1
            j += 1
            continue
        if not new_rows and _TREND_ROW_RE.match(f_line.rstrip("\n")):
            new_rows.append(f_line)
            j += 1
            continue
        c_m = _POINTS_LINE_RE.match(c_line.rstrip("\n"))
        f_m = _POINTS_LINE_RE.match(f_line.rstrip("\n"))
        if (not points_bumped and c_m and f_m
                and int(f_m.group(1)) == int(c_m.group(1)) + len(new_rows)):
            points_bumped = True
            i += 1
            j += 1
            continue
        return False, (
            f"stale (unexpected difference at committed line {i + 1}, "
            f"beyond a trailing trend-row addition)"
        )

    if i != len(committed_lines) or j != len(fresh_lines):
        return False, "stale (content after the expected insertion still differs)"
    if len(new_rows) != 1:
        return False, f"stale ({len(new_rows)} new trend row(s) found, expected exactly 1)"
    if not points_bumped:
        return False, (
            "stale (a new trend row was added but the point-count summary "
            "line was not bumped to match)"
        )

    new_row_groups = _TREND_ROW_RE.match(new_rows[0].rstrip("\n")).groups()
    fresh_trend_rows = _TREND_ROW_RE.findall("".join(fresh_lines))
    if not fresh_trend_rows or fresh_trend_rows[-1] != new_row_groups:
        return False, "stale (the new row is not the trend table's trailing row)"

    return True, (
        f"current except one new trailing trend-table row (commit "
        f"`{new_row_groups[0]}`, {new_row_groups[1]}) and its matching "
        f"point-count bump -- a genuine new commit touched "
        f"docs/state-table.md since this file was last generated, not "
        f"staleness in the rendering itself. Re-run "
        f"`python tools/generate_dashboard.py` to pick up the row as a "
        f"real regeneration."
    )


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


def _candidate_scan() -> dict[str, dict]:
    """One wall-aware scan reused by all candidate census sections."""
    return scan(None, None, True, None, None)


def _files_in_band(files: list[dict], min_size: int | None, max_size: int | None) -> list[dict]:
    lo = min_size if min_size is not None else 0
    return [
        item for item in files
        if lo <= int(item.get("text_size") or 0)
        and (max_size is None or int(item.get("text_size") or 0) <= max_size)
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
        "branch-link (>=4 `bl`/`blx` instructions) filter together, while "
        "`wall_aware_headroom.scan()` filters only by `.text` size and "
        "address, so the table below applies the size half only. "
        "**Brain correction at merge (round 0824c):** an earlier draft of "
        "this paragraph said no committed tool computes the `bl`/`blx` "
        "count and pointed at `PR #1534` as unmerged. Both were already "
        "false when written -- `tools/pool_freshness.py` was on `main` at "
        "this branch's own base commit, its `body_call_count()` counts "
        "exactly those instructions, and #1534 is CLOSED, superseded by "
        "#1542 which merged the rescoped tool. For the dispatch-ready "
        "figure use `python tools/pool_freshness.py --pool wall-bl4-small "
        "--max-size <hi> --exclude-attempted --all-modules`, and "
        "sanity-check its scope against `scan()` -- #1534 was held "
        "precisely for a silently `main`-only default reported as "
        "staleness, which #1542 fixed.")
    add("")
    add("Reproduce per row: `python tools/wall_aware_headroom.py "
        "--exclude-attempted --min-size <lo> --max-size <hi> --json` "
        "(this table sums every module's `candidate` count and each "
        "candidate file's own `text_size`).")
    add("")
    add("| band | candidates (size-only) | bytes (size-only) |")
    add("| --- | ---: | ---: |")
    per = _candidate_scan()
    all_sizes = [
        int(f.get("text_size") or 0)
        for d in per.values()
        for key in ("coercible_files", "unknown_files", "no_marker_files")
        for f in d[key]
    ]
    for label, lo, hi in BANDS:
        count, band_bytes = _band_totals(all_sizes, lo, hi)
        add(f"| {label} | {count:,} | {band_bytes:,} |")
    add("")

    add("### Remaining unmatched `.text` by module")
    add("")
    add("This is the same wall-aware, attempted-excluded candidate population "
        "as the band table, split by module. Confirmed permanent walls are "
        "not included in these candidate columns.")
    add("")
    add("Reproduce: `python tools/wall_aware_headroom.py --json "
        "--exclude-attempted`; each row below sums that JSON module's "
        "`coercible_files`, `unknown_files`, and `no_marker_files`.")
    add("")
    add("| module | permanent count | permanent bytes | unassessed count | "
        "unassessed bytes |")
    add("| --- | ---: | ---: | ---: | ---: |")
    for module, data in sorted(per.items()):
        candidates = [
            f
            for key in ("coercible_files", "unknown_files", "no_marker_files")
            for f in data[key]
        ]
        add(f"| {module} | {data['permanent']:,} | "
            f"{sum(int(f.get('text_size') or 0) for f in data['permanent_files']):,} | "
            f"{len(candidates):,} | "
            f"{sum(int(f.get('text_size') or 0) for f in candidates):,} |")
    add("")
    add("Permanent-wall bytes are not inferred from counts here: the scan's "
        "permanent classification is the exclusion source, while its "
        "candidate file metadata is the byte source. This keeps the two "
        "sides auditable when a wall citation or source span changes.")
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
    add("### Data opportunity disposition")
    add("")
    add("Reproduce the current reachable total with `python tools/data_worklist.py "
        "--version eur --include-data-readers --no-outputs`. This is the "
        "live unmatched placeholder data/bss population with function or "
        "data readers; it is not a forecast and does not claim every shape "
        "has a proven recipe.")
    add("")
    modules = load_all(eur)
    modsecs_map = load_module_sections(eur, "eur", load_binaries=False)
    size_table = build_size_table(modules, modsecs_map)
    graph = build_call_graph(
        modules,
        data_size_of=lambda symbol: size_table.get(
            (symbol.module, symbol.addr), symbol.size,
        ),
    )
    matched = collect_matched_ranges(eur)
    entries = rank_data_symbols(
        modules, graph, matched, min_readers=1,
        modsecs_map=modsecs_map, size_table=size_table,
        include_data_readers=True,
    )
    add("| disposition | symbols | bytes | command / evidence |")
    add("| --- | ---: | ---: | --- |")
    add(f"| reachable, reader-attributed | {len(entries):,} | "
        f"{sum(e.effective_size for e in entries):,} | `data_worklist.py "
        "--include-data-readers --no-outputs` |")
    add("| proven recipe currently shippable |  |  | blank: the build-free "
        "worklist cannot classify the remaining shapes without compiled "
        "bytes |")
    add("| blocked pending per-group verification |  |  | blank for the "
        "whole reachable pool; the latest scoped string-pool disposition is "
        "published in `cm-restock-carve-11-2026-08-24.md` |")
    add("")
    add("The latest scoped string-pool note records 46/1,060 B shipped by a "
        "proven same-size composition recipe and 3,069/66,096 B deferred "
        "pending group verification. Those are a dated sub-pool disposition, "
        "not silently promoted to a project-wide split.")
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
        is_current, detail = _dashboard_is_current(
            OUT.read_text(encoding="utf-8"), text)
        if not is_current:
            print(f"{OUT} is out of date ({detail}). Re-run "
                  f"`python tools/generate_dashboard.py` and commit.", file=sys.stderr)
            return 1
        if detail == "exact match":
            print(f"{OUT} is current.")
        else:
            print(f"{OUT} is current ({detail}).")
        return 0

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(text, encoding="utf-8")
    print(f"wrote {OUT.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
