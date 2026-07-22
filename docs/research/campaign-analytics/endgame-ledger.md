[//]: # (markdownlint-disable MD013 MD041)

# Endgame ledger: remaining uncovered code, by bytes

Snapshot: 2026-07-16, commit `a9c4772d`. **Byte-derived**, not hand-transcribed
— every number below is computed directly from the committed
`config/<region>/**/delinks.txt` tier (brief 583), the same source
`tools/progress.py` already treats as the project's no-build ground truth.

> The previous version of this document (a hand transcription of brief
> prose) explained 11.6% of the real gap, had every EUR row wrong, and had
> no row at all for the single largest gap (ov004, 33% of the total). See
> [§ What changed](#what-changed-from-the-prose-ledger) below for the
> specifics. This version supersedes it entirely.

## Method (reproducible from any commit)

`tools/progress.py::parse_delinks_file` + `CODE_SECTIONS` (`{.text,
.init}`) is the canonical delinks-tier parser — this ledger adds no new
parsing logic, it just calls that parser once per `delinks.txt` (main,
`itcm`, `dtcm`, every `overlays/ov*`) instead of once per region, so the
per-module breakdown survives instead of being collapsed into one number.
A module's **gap** is `total_code - matched_code`: `total_code` sums
`CODE_SECTIONS` bytes from the module-level section map (the file's
authoritative byte range), `matched_code` sums the same sections from TUs
whose status is `complete` (excluding `_dsd_gap@...` synthetic entries,
which never appear in committed `delinks.txt` — dsd only ever synthesizes
those at build time for whatever a `delinks.txt` does *not* claim).

```python
import sys; sys.path.insert(0, "tools")
import progress as pg
from pathlib import Path

def module_gap(delinks_path):
    module_sections, tus = pg.parse_delinks_file(delinks_path)
    total = sum(max(0, e - s) for n, s, e in module_sections if n in pg.CODE_SECTIONS)
    matched = sum(
        max(0, e - s)
        for tu in tus
        if not tu["source"].startswith("_dsd_gap") and tu["status"] == "complete"
        for n, s, e in tu["sections"] if n in pg.CODE_SECTIONS
    )
    return matched, total, total - matched

# Walk config/<region>/arm9/{delinks.txt, itcm/delinks.txt, dtcm/delinks.txt,
# overlays/ov*/delinks.txt} per region and sum module_gap()'s third element.
```

No build, no wine, no ninja — this whole ledger is derived read-only from
files already committed to `main`.

## Totals

| Region | Matched (B) | Total code (B) | **Gap (B)** |
|---|---:|---:|---:|
| EUR | 2,374,740 | 2,388,172 | **13,432** |
| USA | 2,366,076 | 2,387,188 | **21,112** |
| JPN | 2,366,192 | 2,387,188 | **20,996** |
| **3-region total** | | | **55,540** |

## Per-module gap, all 3 regions

Every module with a nonzero gap in at least one region (`dtcm` carries no
`kind:function` entries in any region — 0 everywhere, omitted). Sorted by
3-region total, descending. **Rows sum exactly to the measured total**
(55,540 B) — verified by direct recomputation, not by construction alone.

| Module | EUR gap (B) | USA gap (B) | JPN gap (B) | 3-region total (B) | % of 55,540 |
|---|---:|---:|---:|---:|---:|
| **ov004** | 5,902 | 7,104 | 7,104 | **20,110** | 36.2% |
| main | 2,270 | 4,660 | 4,544 | **11,474** | 20.7% |
| itcm | 1,940 | 2,156 | 2,156 | **6,252** | 11.3% |
| ov019 | 912 | 1,044 | 1,044 | **3,000** | 5.4% |
| ov014 | 816 | 948 | 948 | **2,712** | 4.9% |
| ov003 | 872 | 916 | 916 | **2,704** | 4.9% |
| ov001 | 452 | 452 | 452 | **1,356** | 2.4% |
| ov006 | 0 | 484 | 484 | **968** | 1.7% |
| ov020 | 0 | 476 | 476 | **952** | 1.7% |
| ov015 | 180 | 284 | 284 | **748** | 1.3% |
| ov010 | 0 | 368 | 368 | **736** | 1.3% |
| ov018 | 0 | 348 | 348 | **696** | 1.3% |
| ov002 | 0 | 304 | 304 | **608** | 1.1% |
| ov017 | 0 | 284 | 284 | **568** | 1.0% |
| ov005 | 0 | 224 | 224 | **448** | 0.8% |
| ov016 | 0 | 220 | 220 | **440** | 0.8% |
| ov007 | 88 | 176 | 176 | **440** | 0.8% |
| ov022 | 0 | 160 | 160 | **320** | 0.6% |
| ov009 | 0 | 136 | 136 | **272** | 0.5% |
| ov008 | 0 | 108 | 108 | **216** | 0.4% |
| ov023 | 0 | 100 | 100 | **200** | 0.4% |
| ov021 | 0 | 88 | 88 | **176** | 0.3% |
| ov011 | 0 | 52 | 52 | **104** | 0.2% |
| ov013 | 0 | 20 | 20 | **40** | 0.1% |
| **TOTAL** | **13,432** | **21,112** | **20,996** | **55,540** | **100.0%** |

**ov004 is the largest single gap at 36.2% of the total** (5,902 EUR +
7,104 USA + 7,104 JPN = 20,110 B) — it had no row anywhere in the prose
ledger.

### ov002 wall record

The EUR ov002 function residue has now been mechanically reconciled into
the Brief-294 reg-alloc cohort, the Brief-288/290 P-17 cohort, and the C-34
duplicate-pool-slot residue. See the [verified ov002 wall cohort](ov002-wall-cohort.md)
for the address envelopes, exact non-P-16 members, and re-test evidence.
This source-header census is orthogonal to the byte-derived table above: it
does not change the measured EUR/USA/JPN gap values.

## Reconciliation against size_census.py (brief 596)

PR #1160 (brief 592) planned to render a per-module comparison between
this ledger's byte-derived gap and `tools/size_census.py`'s per-module
unmatched-*function*-byte totals, as a cross-check. That comparison never
actually happened: its `## Comparison` section is a literal, never-
substituted `${rows}` template placeholder, both in the PR body and in
the committed `docs/research/brief-592-census-bundle.md` (lines 130/132).
No prose anywhere in that doc or PR describes specific mismatches either
— the promised comparison was silent, not merely unread.

Brief 596 ran it for the first time: `size_census.collect()`'s per-module
unmatched-function byte total vs. this ledger's `module_gap()` byte total,
for all 57 module/region combinations with a nonzero ledger gap. **55 of
57 match exactly (0 B delta).** The other two — **fully root-caused, zero
unexplained residual** — are both instances of the same underlying cause
(bytes with no `kind:function` entry in `symbols.txt` at all), at two
different scales:

- **ov004, all 3 regions (34 B delta, e.g. EUR 5,902 ledger vs. 5,868
  census):** 17 discrete 2-byte "orphan" gaps, each sitting between two
  named, already-enumerated functions (e.g. EUR `0x021dbc8a-0x021dbc8c`,
  immediately before `func_ov004_021dbc8c`). These are inter-function
  alignment padding — real unclaimed bytes the ledger correctly counts,
  but with no symbol of their own for `size_census.py` (a function-level
  tool by design) to see.
- **`main`, all 3 regions (2,270 B delta, identical byte count in EUR/
  USA/JPN despite very different ledger totals — EUR 2,270 vs. USA 4,660
  vs. JPN 4,544):** dominated by a ~2,048 B block at the very start of
  ARM9 main (`0x02000000` through `~0x02000800`, 19 fragments of ~80-160
  B each, interleaved with a couple of tiny already-matched functions
  such as `VBlankIntrWait` at `0x02000086`) that has **no `symbols.txt`
  entry whatsoever** — not `kind:function`, not `kind:data`, nothing.
  `Entry` (the real ARM9 entry point, `0x02000800`, `0x13c` B) is
  already matched and sits just past this block. The remaining ~222 B is
  the same small-orphan pattern as ov004, scattered through the rest of
  `main`. EUR's `main` shows 0 unmatched *functions* in size_census
  (every named function is carved) — its entire remaining ledger gap
  *is* this unsymbolized block. USA/JPN carry the identical 2,270 B
  block *plus* their own separate, ordinarily-visible unmatched
  functions (the `02099834`-area residue described below), which is why
  their ledger totals differ from EUR's while the orphan component does
  not.

**Neither artifact is wrong.** `size_census.py`'s own docstring scopes it
to named functions in `symbols.txt` ("bucket every UNMATCHED function");
this ledger measures raw uncovered bytes regardless of whether a symbol
exists there. They answer different questions by design, and now
provably agree everywhere except these two fully-explained cases. The
practical takeaway: `size_census.py`'s totals are a *lower bound* on the
true byte gap, not the gap itself — the difference is exactly the bytes
no tool currently has a name for. The `main` startup-code block in
particular is invisible to `size_census.py` *and* to `batch_carve.py`
alike (both are `symbols.txt`-driven) — it isn't a queued, carvable
candidate anywhere right now; naming it would need dsd re-analysis or
manual symbol authoring, not a carve wave. Flagged here as a fresh lead,
not fixed in this brief.

## What changed from the prose ledger

### USA/JPN main floor — not permanent; 12 of 14 named addresses now matched

The old §1 listed 7 addresses per region (14 total) as a **permanent**
verify-fail/gate-fail floor, cross-region reproducibility cited as proof
of structural walls. Re-checked individually against the current tree:

| Address | EUR | USA | JPN |
|---|---|---|---|
| `020b40cc` | matched | **matched** | **matched** |
| `020b40e0` | matched | **matched** | **matched** |
| `020b2c38` | matched | **matched** | **matched** |
| `020b3b84` | matched | **matched** | **matched** |
| `02020fa4` | matched | **matched** | **matched** |
| `020b3988` | matched | **matched** | **matched** |
| `02099834` | matched (as `func_02099718`, drift band) | still a gap | still a gap |

Only **one** of the seven named addresses (`02099834`) remains open in
USA/JPN — the other six shipped once brief 583's own returncode fix
(`tools/batch_carve.py`) and the "main floor autopsy" emitter fix
(`tools/asm_escape.py`, cross-function tail-merge labels + single-register
push/pop byte-exactness) landed. This is the concrete, measured version of
r5's point: deterministic *tool* bugs reproducing identically across
regions looked like a structural floor, and weren't one. `02099834` is the
one address dsd's delink flags specially ("Function at 0x02099834 was
adjusted to include pre-code constant pool at 0x02099820") — worth a
dedicated look, not a default assumption of permanence. The remaining USA
(4,660 B) / JPN (4,544 B) `main` gap in the table above includes this
address plus whatever else in `main` isn't yet a named/tracked park.

### EUR data blobs — closed

The old §2 listed `020b2d2c` and `020b3c78` as pending (Brief 578). Both
are now matched: `src/main/func_020b2d2c.s`, `src/main/func_020b3c78.s`.
Closed; no longer a residual.

### EUR non-floor ov006 parks — phantom, struck

**The old §6 (11 EUR ov006 "verify-fail, non-floor" parks) is struck.**
Measured directly: `config/eur/arm9/overlays/ov006/delinks.txt` has
`matched_code == total_code == 102,972` — **zero gap**. Whatever those 11
addresses represented at the time §6 was written, ov006 in the current
tree is 100% matched. This is exactly r5's finding (independently
reproduced): every one of those park addresses sits inside a `complete` C
TU, not a real residual.

### ITCM — corrected split (11 EUR + 14 USA + 14 JPN, not "39 EUR")

The old §7 recorded "39 uncarved ITCM functions" as an undifferentiated
EUR-only count, sourced from an r4 discussion that never enumerated
addresses. Directly censused (both at the function level via
`tools/size_census.py` post-fix, and at the byte level via
`parse_delinks_file` — the two independently agree):

| Region | ITCM functions | Unmatched functions | Gap (B) |
|---|---:|---:|---:|
| EUR | 14 | 11 | 1,940 |
| USA | 14 | 14 | 2,156 |
| JPN | 14 | 14 | 2,156 |

39 total unmatched functions, split 11/14/14 — not 39 in EUR alone. EUR
has already carved 3 of its 14; USA/JPN haven't started. `itcm` was
previously invisible to every census tool (`size_census.py`'s
`_module_paths()` never yielded it) — see brief 583's `tools/size_census.py`
fix in the same PR as this ledger.

### Carried forward, not re-verified this pass

The old §4 (permanent ISA floor: `mcr`/`mrc`/`swi`/`msr`/`mrs`-carrying
`.s` files, 42 EUR / 26 USA / 26 JPN) and §5 (parked near-miss C-match
families) are function-level research catalogues, not byte-gap accounting
— out of scope for this brief's byte re-derivation. They are **not**
struck, but also not independently re-verified here; treat them as
carried forward from the prior ledger pending their own audit.

## Source accounting notes

- This ledger's numbers are exact for commit `a9c4772d` and will drift as
  soon as the next carve/match lands — that's expected of any point-in-time

## Appendix: ITCM detail

Per-function unmatched ITCM rows from `tools/size_census.py`:

| Name | Address | Size | Region |
|---|---|---:|---|
| `func_01ff8000` | `0x01ff8000` | `0x98` | EUR |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | EUR |
| `func_01ff8180` | `0x01ff8180` | `0x58` | EUR |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | EUR |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | EUR |
| `func_01ff8414` | `0x01ff8414` | `0x130` | EUR |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | EUR |
| `func_01ff8624` | `0x01ff8624` | `0x40` | EUR |
| `func_01ff8664` | `0x01ff8664` | `0x60` | EUR |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | EUR |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | EUR |
| `func_01ff8000` | `0x01ff8000` | `0x98` | USA |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | USA |
| `func_01ff8180` | `0x01ff8180` | `0x58` | USA |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | USA |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | USA |
| `func_01ff8400` | `0x01ff8400` | `0x14` | USA |
| `func_01ff8414` | `0x01ff8414` | `0x130` | USA |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | USA |
| `func_01ff8624` | `0x01ff8624` | `0x40` | USA |
| `func_01ff8664` | `0x01ff8664` | `0x60` | USA |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | USA |
| `func_01ff86fc` | `0x01ff86fc` | `0x74` | USA |
| `func_01ff8770` | `0x01ff8770` | `0x50` | USA |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | USA |
| `func_01ff8000` | `0x01ff8000` | `0x98` | JPN |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | JPN |
| `func_01ff8180` | `0x01ff8180` | `0x58` | JPN |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | JPN |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | JPN |
| `func_01ff8400` | `0x01ff8400` | `0x14` | JPN |
| `func_01ff8414` | `0x01ff8414` | `0x130` | JPN |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | JPN |
| `func_01ff8624` | `0x01ff8624` | `0x40` | JPN |
| `func_01ff8664` | `0x01ff8664` | `0x60` | JPN |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | JPN |
| `func_01ff86fc` | `0x01ff86fc` | `0x74` | JPN |
| `func_01ff8770` | `0x01ff8770` | `0x50` | JPN |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | JPN |
  derivation. Re-run the method above against a fresh checkout rather than
  trusting this snapshot once meaningful time has passed.
- `dtcm` is walked by the method above (for completeness/symmetry with
  `itcm`) but carries no `kind:function` entries in any region, so it
  never contributes a nonzero row.
- The 3-region total dropped from 61,404 B (r5's snapshot, commit
  `97e0ef5a`) to 55,540 B by the time this ledger was written, purely from
  real work landing in between (main-floor-autopsy-577, cmatch-ov-579,
  cmatch-queue-580) — a live demonstration of why this document needs to
  be regenerated from bytes on demand, not maintained as hand-written
  prose that answers a question about a tree that no longer exists by the
  time someone reads it.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
