[//]: # (markdownlint-disable MD013 MD041)

# q-eur-next-frontier — what moves EUR, costed and dated

**Snapshot:** 2026-08-28, `origin/main` at HEAD `223d81119` (round 0829
review) unless a figure states its own timestamp. Every number below is
re-derived from committed files in this tree, not inherited from an
earlier round — the vintage rule (`docs/research/band-rate-vintage.md`)
is why that distinction is the entire point of this document; see
*Code frontier Finding 1/3* and *What this does not establish* for where
it bites hardest.

## The finding this whole document turns on

**"EUR is stuck at 17.27%" is a claim about `.text` bytes only.**
`tools/progress.py`'s `c_code_bytes_by_class()` / `c_code_total_bytes()` —
the exact pair `docs/state-table.md`'s "Readable C by region" and
`docs/dashboard.md`'s headline both call — scan **only `.text` sections**
from every `delinks.txt`. `.data`/`.bss`/`.rodata` never enter that ratio
at all; `state-table.md`'s own structure keeps "Readable C by region" and
"EUR data typing" as two separate sections with no combined figure
anywhere in this project.

That means: **the CODE avenue is the only one that can move the 17.27%
number this document's own motivation cites.** The DATA avenue (407,506 B,
the largest single figure below) is real, large, and has a measurable
per-round yield — but it moves a *different*, separately-tracked metric,
not natural-C%. Both are genuine EUR progress; only one moves the specific
number everyone has been watching sit still for five rounds. This
distinction is not a recommendation — it's a fact about which avenue
answers which question, and it changes how every number below should be
read.

## Canary

Per the item's own instruction: re-derive the 257-320 B band's remaining
count (published: 263) before costing anything else.

```bash
$ python tools/eur_frontier_census.py
```

```text
257-320 B              263       75980             411       118200
```

**263 candidates / 75,980 B, exact match** — with the campaign's actual
dispatch filter (`>=4` exact `bl`/`blx` calls, the same two-part criterion
`docs/dashboard.md`'s own remaining-pool table documents and uses). ⚠️ A
first pass without that filter returned **411 / 118,200** — a real,
material-looking discrepancy that would have wrongly triggered a STOP —
resolved by re-checking `docs/dashboard.md`'s own reproduce-command
caveat (`.text` size alone is not the real dispatch criterion) rather than
concluding the population had shifted. Both figures are reported
throughout this document, clearly labeled, because the gap between them
is itself informative (see *Code frontier* below). Canary passed; the
263-candidate figure is unchanged since it was last published. Proceeded
to cost the remaining avenues.

## Avenue 1 — Code frontier

```bash
$ python tools/eur_frontier_census.py     # single scan, all 7 bands, 2026-08-28
```

| Band | Dispatch-ready (`>=4` bl/blx) | Size-only (`.text` span alone) | Historical rate (vintage) |
|---|---:|---:|---|
| ≤192 B | 0 cand / 0 B | 1,160 cand / 135,268 B | drained (prior rounds) |
| 193-256 B | **204 cand / 46,080 B** | 460 cand / 102,472 B | 0/60 = 0.0% (`cm-main-exploit-drain-2`/`cm-main-boundary-rerun`, ~2026-08-22/24, per `band-rate-vintage.md`) |
| 257-320 B | 263 cand / 75,980 B | 411 cand / 118,200 B | 4/20 = 20.0% (sample size 20, vintage ~2026-08-24, per queue text) |
| 321-376 B | 161 cand / 56,180 B | 231 cand / 80,280 B | 1/15 = 6.7% (sample size 15) |
| 377-512 B | **349 cand / 154,308 B** | 431 cand / 189,868 B | *no historical figure exists — see below* |
| 513-1023 B | **524 cand / 370,136 B** | 595 cand / 420,104 B | 0/15 = 0.0% (sample size 15) |
| ≥1024 B | **313 cand / 686,816 B** | 334 cand / 719,592 B | 1 logged attempt total, ever (`attempts.tsv`) |
| **Total** | **1,814 cand / 1,389,500 B** | **3,622 cand / 1,861,784 B** | |

**Finding 1 — the small bands are not exhausted; the pool was resampled,
not drained.** "193-256 B closed at 0/60" and "321-376 B closed at 1/15"
describe a specific ROUND's attempt count, not the band's total
population. `--exclude-attempted` removes every row already logged in
`docs/research/campaign-analytics/attempts.tsv` (1,785 rows total, checked
directly — 267 of them fall in 193-256 B, 70 in 321-376 B), and what's
left after that exclusion is still 204 and 161 candidates respectively.
These are genuinely never-attempted rows sitting behind the already-tried
ones, not evidence the 0% rate is stale-but-still-applicable — no ship
rate exists for *this specific* remaining population; the historical
figures above describe a disjoint, already-excluded sample.

**Finding 2 — the largest remaining pool by far sits in bands with almost
no attempt history, and one band has none published at all.** 377-512 B,
513-1023 B, and ≥1024 B together hold **1,211,260 B dispatch-ready**
(349+524+313 = 1,186 candidates) — **87% of the entire 1,389,500 B
dispatch-ready pool**, against only **66 + 16 + 1 = 83 logged attempts
combined** in `attempts.tsv` (checked directly, per-band breakdown above).
377-512 B has no historical rate in this project's records at all — it is
simply absent from every recap this item's own brief lists (≤192, 193-256,
257-320, 321-376, then a jump straight to 513-1023), and this census found
no doc describing it. **No ship rate can be honestly stated for any of
these three bands** — 83 attempts against 1,186 remaining candidates is
not a sample large enough to extrapolate from, and this project's own
`band-rate-vintage.md` shows even a same-band resample can collapse a
measured rate from 27.6% to 0%. Blank, not a guess.

**Finding 3 — the two published rates that DO exist (257-320 B at 20.0%,
321-376 B at 6.7%) are each a single small sample (n=20, n=15) from
~2026-08-24, over three weeks before this snapshot.** Quoting them forward
as the current rate for the *fresh* 263/161 candidates behind them would
repeat the exact error `band-rate-vintage.md` documents happening once
already in this same band. They are reported above as historical context,
dated, not as a current estimate.

## Avenue 2 — Data pool

```bash
$ python tools/data_worklist.py --version eur --include-data-readers --no-outputs   # 2026-08-28
Total worklist bytes: 407,506
```

**Unchanged from the figure recorded right after the Windows fix landed**
(`cm-restock-carve-15`, PR #1580) — meaning no round has moved this
specific number since. Confirmed against the primary doc
(`docs/research/data/cm-restock-carve-15-2026-08-26.md:104-107`): the
fix-only measurement (before that round's own 141-symbol carve landed in
the same PR) was **8,230 symbols / 429,350 B**; after the carve, **8,099 /
407,506** — the 407,506 figure already has that round's ships subtracted
out, and it is the only carve round to have run since. **This document's
own brief text's "roughly 220,000 B hidden" is an understatement** by
exactly the 22,144 B that round also shipped: the fix alone added
**+241,590 B / +2,909 symbols**, not +219,746 B.

### Historical per-round yield (`cm-restock-carve` series)

| Round | PR | Date | Symbols | Bytes |
|---|---|---|---|---:|
| carve-1 | #1464 | 2026-08-06 | 31/35 | 1,960 |
| carve-2 | #1473 | 2026-08-08 | 58/58 | 16,412 |
| carve-3 | #1476 | 2026-08-08 | 66 | 1,348 |
| carve-4 | #1481 | 2026-08-08 | 22 | 488 |
| carve-5 | #1487 | 2026-08-09 | 9 | 328 |
| carve-6 | #1493 | 2026-08-09/10 | 9 | 144 |
| carve-7 | #1496 | 2026-08-14 | 36 | 1,864 |
| carve-8 | #1501 | 2026-08-14/16 | 6 | 352 |
| carve-9 | #1507 | 2026-08-17 | 694 | 11,716 |
| carve-10 | #1526 | 2026-08-22 | 739 | 15,732 |
| carve-11 | #1547 | 2026-08-24 | 46 | 1,060 |
| carve-12 | #1561 | 2026-08-24 | 0 | 0 (composition — dead, see below) |
| carve-13 | #1565 | 2026-08-24 | 201 | 7,100 |
| carve-14 | #1573 | 2026-08-25 | 167 | 2,004 |
| carve-15 | #1580 | 2026-08-26 | 141 | 22,144 (`.bss`, a different lever from 1-14's `.data`/`.rodata`) |

**Totals: 2,225 symbols / 82,652 B over 15 rounds. Mean 5,510 B/round,
median 1,864 B/round** (N=15; every row individually sourced to its own
doc/commit — see this document's git-blame or the queue item for the full
citation list). The mean is dominated by 4 outlier rounds (2, 9, 10, 15 =
66,004 B, 80% of all bytes shipped); excluding carve-15 (a structurally
different `.bss` lever, not yet repeated), rounds 1-14 total 60,508 B,
mean 4,322 B/round, median 1,204 B/round.

**Arithmetic, not a forecast:** at the 15-round mean (5,510 B/round), the
current 407,506 B pool represents roughly 74 further rounds at that rate;
at the median (1,864 B/round), roughly 219. Both numbers describe a
historically volatile per-round rate (a 4-round outlier set carries 80% of
all bytes ever shipped) applied naively to today's pool size — not a
projection of what will actually happen, and not a recommendation.

**What shapes remain unclassified:** by section, the reachable pool is
**`.bss` 10,416 B, `.data` 238,983 B, `.rodata` 158,107 B** (sums exactly
to 407,506; `.text`/`.dtcm`/`.itcm`/`unknown` are all 0, itself evidence
the Windows classification bug is fully closed — no residual "unknown"
bucket remains). By module: **`main` 190,208 B / 4,678 symbols, overlays
217,298 B / 3,421 symbols** (see *Overlay/ITCM* below) — reproduced
directly (`--module main` vs. the overlay sum), cross-checked to sum
exactly to the 407,506/8,099 totals both ways (by section and by module),
no discrepancy in either cross-check.

**What would raise the rate:** not determinable build-free — the campaign's
own per-round variance (144 B to 22,144 B) suggests the limiting factor is
which SHAPES a given round's method can attack, not a fixed rate; this
document does not have evidence to say which shape unlocks the next
outlier round.

## Avenue 3 — `.bss`

Two genuinely different, both-correct measurements exist, with different
denominators — reconciling them, not picking one, is the finding:

| Measurement | `.bss` bytes | Denominator | `.bss` share | Source / date |
|---|---:|---:|---:|---|
| Project-wide, all `.bss` regardless of readers | 4,067,552 | 4,776,528 (every `.data`/`.rodata`/`.ctor`/`.dtor`/`.bss` byte in every EUR `delinks.txt`, matched or not) | **85.2%** | `docs/research/data/cm-data-typing-16-2026-07-30.md:14-17,83-87` (`cm-bss-carve-scope.md` only cites this figure, doesn't originate it) |
| Reachable worklist (unmatched, has a reader) | 10,416 | 407,506 (the Avenue 2 pool) | **2.56%** | `python tools/data_worklist.py --version eur --include-data-readers --no-outputs --section bss`, 2026-08-28 — independently re-confirmed with `--min-readers 0` too: 10,624/468,954 = 2.27% |

These are not in tension. `.bss` genuinely is 85.2% of the project's total
unclaimed data-section bytes (project-wide, `data_typing_16`'s own
methodology, quoted verbatim above) — **and** it is almost absent from the
worklist `data_worklist.py` ranks as actionable, because `.bss` buffers
are typically large, unstructured, zero-initialized regions that rarely
have the kind of distinct per-symbol "reader" edge the worklist's ranking
requires. **The `.bss` opportunity is real and large in raw bytes (over 4M)
but is not reachable by the tool this campaign currently uses to find
carve targets** — that is the blocker, stated plainly, not a direction.
`0% C-owned` (`data_typing_16`, same source) is unchanged: this census
found no `.bss` `.c` ownership either.

## Avenue 4 — Overlay / ITCM / DTCM

**Correction to this item's own premise:** ITCM and DTCM contribute **0
bytes / 0 symbols** to the reachable pool, independently confirmed:
`grep -c "kind:data\|kind:bss" config/eur/arm9/itcm/symbols.txt` → 0 (ITCM
has no data symbols at all in this game — it is code-only); DTCM has only
5 symbol lines total. The Windows bug's hidden portion was **entirely
overlay data**, not "overlay and ITCM/DTCM" as the motivating text framed
it.

| Category | Bytes | Symbols | Command |
|---|---:|---:|---|
| `main` | 190,208 | 4,678 | `--module main --include-data-readers` |
| Overlays (ov000-ov023) | **217,298** | 3,421 | sum of 24 × `--module ov0NN` |
| ITCM + DTCM | 0 | 0 | `--section dtcm,itcm` (also confirmed via `--cluster E`) |
| **Total** | **407,506** | **8,099** | matches Avenue 2 exactly, both ways |

**Top overlays: `ov004` 138,739 B / 864 symbols, `ov000` 39,552 B / 1,301
symbols** — together 178,291 B, 82% of the overlay pool, 44% of the whole
reachable pool. `ov002` (18,196 B/326), `ov011` (2,928 B/105), `ov021`
(2,520 B/156), `ov006` (2,364 B/103), and 18 smaller overlays (12,999 B/566
combined) make up the rest.

**Post-fix progress:** exactly one carve round (`cm-restock-carve-15`,
PR #1580) has run since the fix — the series stops at 15; every commit
after it (#1583 onward) is a port-drain, fingerprint-evidence, or audit
lane, not a data carve. That round shipped **141 symbols / 22,144 B**, all
of it `ov002`'s `.bss`. Of the 239,442 B the bug had hidden (217,298 still
reachable + 22,144 already shipped), **9.2% has been carved; 217,298 B
remains, entirely untouched by any round since the fix.**

## Composition into the data pool

**Confirmed dead**, directly from its own closing doc: `cm-restock-carve-12`
(`docs/research/data/cm-restock-carve-12-2026-08-24.md:3`) — "the pool it
was built to drain is a clean 0-of-575." 576 windows / 3,069 symbols /
66,096 B were the input; 561 rejected on mixed sizes, 14 same-size groups
failed on content/order; 0 of 575 content-valid windows passed. No new
evidence found to reopen it; not re-costed further.

## Bottom line, per avenue

| Avenue | Bytes reachable (dated) | Ship rate | Moves natural-C%? | Blocker |
|---|---:|---|---|---|
| Code, ≤192 + 193-256 + 321-376 B (3 bands, 257-320 own row below) | 0 + 46,080 + 56,180 = 102,260 B dispatch-ready (2026-08-28) | Historical 0.0%/6.7%, both stale samples — **blank for the current pool** | **Yes** | No known-good discriminator for this shape class |
| Code, 257-320 B | 75,980 B dispatch-ready (2026-08-28, canary-confirmed) | Historical 20.0% (n=20, dated ~08-24) — **not re-confirmed against the current 263** | **Yes** | Same as above |
| Code, 377-512/513-1023/≥1024 B | **1,211,260 B dispatch-ready** (2026-08-28) — 87% of the whole code pool | **Blank — 83 total logged attempts against 1,186 candidates, not extrapolable** | **Yes** | Almost entirely unattempted; no evidence exists either way |
| Data, reachable pool | 407,506 B (2026-08-28, unchanged since the fix) | Mean 5,510 B/round, median 1,864 B/round (N=15, 2026-08-06 to 08-26) | **No** (separate metric) | Per-round yield is real but small and volatile; no known lever to raise it |
| `.bss`, project-wide | 4,067,552 B raw (2026-07-30 methodology, re-confirmed 0% owned 2026-08-28) | **Blank — not reachable by the current worklist tool at all** | No (separate metric) | No tool ranks/targets raw `.bss` buffers the way `data_worklist.py` ranks reader-attributed symbols |
| Overlay data (post-fix) | 217,298 B (2026-08-28) | 9.2% of the hidden portion carved in 1 round so far | No (separate metric) | Newly visible; only one round of evidence exists |
| Composition | 0 B (confirmed dead) | 0/575 | No (separate metric) | Structurally rejected — not a live avenue |

## Critic pass — weakest provenance

**The 377-512/513-1023/≥1024 B "1.2MB unswept" figure is the least
independently corroborated number in this document** — it rests entirely
on `wall_aware_headroom.py`'s own wall/coercible/unknown classification
(the same tool every other code-frontier figure in this project's history
already trusts), cross-checked here only against `attempts.tsv`'s raw
row count, not against a second, independent classification method. If
`wall_aware_headroom.py`'s classifier has a blind spot for large
functions specifically (untested by this census), this figure could
overstate genuinely-convertible territory. This is flagged, not
resolved — resolving it would mean attempting candidates, out of scope
here.

**Second-weakest: the data per-round yield mean/median.** N=15 with an
80%-from-4-outliers concentration is a small, skewed sample; the
"74 vs 219 rounds" arithmetic should be read as illustrating the range
of plausible outcomes from historical volatility, not as two competing
predictions to choose between.

## What this does not establish

- **No ship rate is claimed for any band or pool where none could be
  honestly re-derived.** Per the item's own instruction, blank stands
  where a figure cannot be derived, rather than an inherited or estimated
  number.
- **No direction is recommended.** Every "moves natural-C%?" and "blocker"
  cell states a fact about the avenue, not a judgment about whether the
  campaign should pursue it.
- **This is a snapshot**, not a rate. Per `band-rate-vintage.md`'s own
  standing rule, re-derive before quoting any number here as current in a
  future round.

## Reproducing every figure in this document

```bash
# Code frontier (all 7 bands, one scan):
python tools/eur_frontier_census.py

# Canary / individual band cross-check:
python tools/wall_aware_headroom.py --exclude-attempted --min-size 257 --max-size 320 --min-bl-blx 4 --json

# Data pool total, module/section breakdown:
python tools/data_worklist.py --version eur --include-data-readers --no-outputs
python tools/data_worklist.py --version eur --include-data-readers --no-outputs --module main
python tools/data_worklist.py --version eur --include-data-readers --no-outputs --section bss
python tools/data_worklist.py --version eur --include-data-readers --no-outputs --section dtcm,itcm

# EUR/USA/JPN natural-C %:
python -c "import sys; sys.path.insert(0,'tools'); import progress; from pathlib import Path; print(progress.c_code_bytes_by_class(Path('config/eur')), progress.c_code_total_bytes(Path('config/eur')))"

# attempts.tsv per-band logged-attempt counts:
# (see this document's own git history for the exact one-off script used;
# docs/research/campaign-analytics/attempts.tsv is the source, column
# `text_size`)

# ITCM/DTCM symbol-table check:
grep -c "kind:data\|kind:bss" config/eur/arm9/itcm/symbols.txt
grep -c "kind:data\|kind:bss" config/eur/arm9/dtcm/symbols.txt
```
