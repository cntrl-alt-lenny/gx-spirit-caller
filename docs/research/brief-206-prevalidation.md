# Brief 206 pre-validation — what the matched_functions fix will recover

**Investigation:** brain-PR while brief 206 + 207 are in flight
(2026-05-23 evening).
**Question:** how big a recovery does brief 206's reloc-resolution
harness actually achieve? Concrete numbers to set scaffolder
expectation + a canary list to test the fix against.

## Headline

**47 units** currently sit at `complete_code_percent: 100.0` AND
`matched_functions: None` — these are the brief 206 target set. If
the fix lands cleanly, `matched_functions` climbs from **1630 →
1677** (+47). 21 of the 47 already register `fuzzy_match_percent ≥ 95%`
— the high-confidence subset that should flip first.

## Methodology

Re-ran `ninja report` on EUR main post brief 204/205 merge.
Bucketed every unit by:

- `matched` — `matched_functions` populated AND `complete_code_percent
  == 100`
- `complete_but_not_matched` — `complete_code_percent == 100` but
  `matched_functions` is `None`. **This is brief 206's target.**
- `incomplete` — `complete_code_percent < 100` (out of scope; needs
  source-side work, not measurement-side)

## Breakdown of the 47

By source-file extension:

| Extension | Count | Notes |
|---|---:|---|
| `.s` | 45 | Worked examples + wall-recipe drains (briefs 191/192/195/197/202/204/205) |
| `.c` | 1 | Single .c-source with extern-heavy reloc count |
| `.legacy.c` | 1 | `OSi_PostIrqEvent` (brief 203 pick 1) |

The `.s` dominance confirms the root cause: hand-written assembly
has zero relocs (raw `.word` directives), while orig delinks have
real reloc records. Unrelocated bytes can never match — objdiff
correctly reports < 100% fuzzy on these, hence `matched_functions
== None`. Post-link they ARE byte-identical (SHA1 verifies).

## Canary list — sorted by fuzzy_match_percent descending

Test brief 206's fix against these in order. The high-fuzzy picks
flip first; if they don't, the reloc resolver isn't working.

| Unit | Source | fuzzy_match |
|---|---|---:|
| `src/main/func_020988a8` | `.s` | 98.44% |
| `src/main/func_020285bc` | `.s` | 98.25% |
| `src/main/func_02024430` | `.s` | 97.83% |
| `src/main/func_020286a0` | `.s` | 97.78% |
| `src/main/func_0200ac60` | `.s` | 97.67% |
| `src/main/func_02006950` | `.s` | 97.56% |
| `src/main/OSi_PostIrqEvent.legacy` | `.legacy.c` | **97.44%** |
| `src/main/func_02027048` | `.s` | 97.06% |
| `src/main/func_020234f8` | `.s` | 96.77% |
| `src/main/func_02024024` | `.s` | 96.77% |
| `src/main/func_0202a27c` | `.s` | 96.77% |
| `src/main/func_020244e8` | `.s` | 96.55% |
| `src/main/func_02024574` | `.s` | 96.55% |
| `src/main/func_020270d0` | `.s` | 96.55% |
| `src/main/func_02028790` | `.s` | 96.55% |
| `src/main/func_020318b8` | `.s` | 96.55% |
| `src/main/func_02006a38` | `.s` | 95.88% |
| `src/main/func_0202a1cc` | `.s` | 95.83% |
| `src/main/func_02026fd8` | `.s` | 95.71% |
| `src/main/func_020071c4` | `.s` | 95.45% |
| `src/main/func_0202142c` | `.s` | 95.31% |

(21 entries — the remaining 26 of the 47 sit below 95% fuzzy but
still show complete_code_percent=100. Worth testing those too, but
the high-fuzzy set is the cleanest signal.)

## Expected post-fix metrics

| Metric | Now | Post-brief-206 (estimate) |
|---|---:|---:|
| `matched_functions` | 1630 / 9801 | **1677 / 9801** (+47) |
| `matched_code_percent` | 1.7260% | ~1.83-1.85% (estimate; depends on byte sizes of the 47) |
| `complete_units` | 1636 / 2507 | 1636 / 2507 (unchanged — already correctly counted) |
| `fuzzy_match_percent` | 1.8787% | ~1.93-1.95% (the recovered units jump from sub-100 to 100) |

## What's NOT in scope for brief 206

The 871 units at `complete_code_percent < 100` are NOT brief 206's
problem — those have actual source-side divergence, not just
reloc-record divergence. Brief 206 fixes the measurement;
genuinely-incomplete units still need a recipe / iteration / wall
research.

## Signal for "did the fix work"

After brief 206 lands, re-run `ninja report` and check:

1. `OSi_PostIrqEvent.legacy` should show `matched_functions: 1/1`
   (currently `None/1`) — best canary because it's the only
   `.legacy.c` in the set, and `.legacy.c` is the routing tier
   most affected by reloc-record divergence.
2. At least one of the 95%+ fuzzy `.s` picks (e.g.
   `func_020988a8` at 98.44%) should now show `matched_functions:
   1/1`.
3. `matched_functions` total ≥ 1670.

If (1) ticks but (2) doesn't, the reloc resolver is handling
`.legacy.c` (which has the standard reloc patterns mwldarm
expects) but choking on `.s` (which has zero relocs — needs special
handling). Brief 207+ followup territory.

If neither ticks, the fix isn't reaching the report-generate
step — investigate the ninja-rule wiring.

## TL;DR

47 functions are sitting one bug-fix away from being properly
counted. Brief 206 closes this gap. Headline metric after fix:
**matched_functions 1677 / 9801 (17.11%)**.
