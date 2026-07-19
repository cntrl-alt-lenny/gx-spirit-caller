[//]: # (markdownlint-disable MD013 MD041)

# Brief 615 — the honest-metric dashboard (r7-16)

**Asked:** rate-of-progress is sold as headline byte-%, but the
tractable readable-C ceiling is ~14-24% of bytes, not 100% (r7-14).
Extend `progress.py --by-module` (brief 587) with per-module columns
that make the real target visible: a tiered, wall-enriched
tractable-C-ceiling estimate, an attainment ratio (current-C /
tractable-C), and a done-class (finishable vs. asymptotic, r7-15).
Build-free, WINE-FREE. Mandatory CANARY: the new columns' denominator
must reconcile against the endgame ledger's independently-derived
ov004 = 36.2% of the 3-region byte gap (brief 583), within a stated
tolerance — or stop and report the mismatch instead of shipping.

**Short answer: shipped, CANARY reconciles (36.55% vs. 36.2%, +0.35pp,
fully explained by real drift since the ledger's snapshot — see §2),
and the headline tractable-ceiling number this model produces is
**29.56% of EUR's `.text`-total** — moderately *above* r7-14's stated
14-24% band, not inside it. That gap is reported here, not hidden: my
two-tier model is deliberately simpler and coarser than r7-14's own
multi-day per-wall census (§3), and the divergence is itself
informative about where the two estimates disagree.

## 1. What shipped

`tools/progress.py --version <eur|usa|jpn> --by-module` gained three
columns beyond the existing code%/C% (brief 587): **ceiling %**
(`tractable_ceiling` as a fraction of the module's `.text`-only total),
**attainment** (`c_bytes / tractable_ceiling`, "n/a" when the ceiling
is 0 — undefined, not zero, e.g. `dtcm`), and **class**
(`"asymptotic"` / `"finishable"`, r7-15). A new `--canary` flag
reconciles the 3-region denominator against the endgame ledger and
exits 1 on mismatch — a reusable, re-runnable check, not a one-off
script (§2). All of it reads only committed `config/**/delinks.txt`
data; no build, no wine, no ninja.

Full EUR dashboard:

```
$ python3.13 tools/progress.py --version eur --by-module

Yu-Gi-Oh! GX Spirit Caller (eur) — per-module code% / C% / honest metric (brief 615)

  module    code %    matched/total code (B)      C %     C / .text-total (B)  ceiling %  attainment  class      
  ---------------------------------------------------------------------------------------------------------------
  main      99.69%             735810/738080   10.04%            74120/738080     19.04%      52.75%  asymptotic 
  itcm      12.62%                  272/2156    6.31%                136/2156     76.58%       8.24%  finishable 
  dtcm       0.00%                       0/0    0.00%                     0/0      0.00%         n/a  finishable 
  ov000    100.00%               21296/21296   17.32%              3688/21296     79.33%      21.83%  finishable 
  ov001     70.11%                 1060/1512    5.29%                 80/1512     76.32%       6.93%  finishable 
  ov002    100.00%           1129372/1129372    4.46%           50316/1129252     14.01%      31.80%  asymptotic 
  ov003     95.93%               20544/21416    6.72%              1436/21372     76.68%       8.76%  finishable 
  ov004     92.99%               78326/84228   11.23%              9452/84184     77.81%      14.43%  finishable 
  ov005    100.00%               29092/29092    7.40%              2136/28872     76.85%       9.63%  finishable 
  ov006    100.00%             102972/102972   19.86%            20356/102488     79.97%      24.84%  finishable 
  ov007    100.00%                 3344/3344   38.57%               1256/3256     84.64%      45.57%  finishable 
  ov008    100.00%               32536/32536    4.08%              1328/32536     76.02%       5.37%  finishable 
  ov009    100.00%               13328/13328    7.61%              1004/13196     76.90%       9.89%  finishable 
  ov010    100.00%               26284/26284   15.19%              3964/26096     78.80%      19.28%  finishable 
  ov011    100.00%               37476/37476   15.40%              5764/37424     78.85%      19.53%  finishable 
  ov012    100.00%                 8972/8972    9.27%                832/8972     77.32%      11.99%  finishable 
  ov013    100.00%                 6640/6640    7.83%                520/6640     76.96%      10.18%  finishable 
  ov014     92.41%                9932/10748    5.24%               556/10616     76.31%       6.86%  finishable 
  ov015     98.75%               14272/14452   20.46%              2936/14348     80.12%      25.54%  finishable 
  ov016    100.00%               27716/27716   11.35%              3120/27496     77.84%      14.58%  finishable 
  ov017    100.00%               23724/23724    9.21%              2168/23548     77.30%      11.91%  finishable 
  ov018    100.00%               11844/11844   23.20%              2748/11844     80.80%      28.71%  finishable 
  ov019     93.65%               13452/14364    9.13%              1300/14232     77.28%      11.82%  finishable 
  ov020    100.00%               14624/14624   15.92%              2328/14624     78.98%      20.16%  finishable 
  ov021    100.00%                 6632/6632   41.87%               2740/6544     85.47%      48.99%  finishable 
  ov022    100.00%                 5128/5128   13.26%                680/5128     78.32%      16.93%  finishable 
  ov023    100.00%                   236/236   37.29%                  88/236     84.32%      44.22%  finishable 
  ---------------------------------------------------------------------------------------------------------------
  TOTAL     99.44%           2374884/2388172    8.18%          195052/2385948     29.56%      27.65%             

  tractable-C ceiling: 705342 / 2385948 bytes (29.56% of .text-total) -- an ESTIMATE, not a measurement (see tractable_ceiling_bytes() for the tier assumptions); c.f. r7-14's independently-derived 14-24% band.
```

**Headline tractable-C ceiling: 29.56% of EUR's `.text`-total (705,342 /
2,385,948 B)** — 3.6× today's 8.18% C%, in the same "a few times
current, not 100%" spirit as r7-14 even though the exact band differs
(§3).

## 2. The CANARY

```
$ python3.13 tools/progress.py --canary
CANARY [OK]: ov004 = 20110 / 55016 B = 36.55% of the 3-region gap (ledger: 36.2%, tolerance +/-1.0pp, delta +0.35pp)
```

`three_region_module_gaps()` sums `summarize_by_module()`'s
`(total_code - matched_code)` across `config/eur`, `config/usa`,
`config/jpn` — the exact same `parse_delinks_file` + `CODE_SECTIONS`
method `docs/research/campaign-analytics/endgame-ledger.md` (brief
583) independently implements. Recomputed live (not read from the
committed ledger doc) and compared per-module against its 2026-07-16
snapshot (commit `a9c4772d`):

| Module | Ledger (2026-07-16) | Live (this brief) | Delta |
|---|---:|---:|---:|
| ov004 | 20,110 | 20,110 | **0** |
| main | 11,474 | 11,094 | −380 |
| itcm | 6,252 | 6,196 | −56 |
| ov007 | 440 | 352 | −88 |
| *(all other 20 modules)* | — | — | **0** |
| **3-region total** | **55,540** | **55,016** | **−524** |

23 of 24 nonzero-gap modules match the ledger snapshot exactly.
ov004's absolute gap is byte-for-byte unchanged — no carve/match work
has landed there since the snapshot. The other three deltas (main,
itcm, ov007, summing to exactly the −524 B total delta) are real,
attributable progress landing in the 3 days between the ledger's
snapshot and this brief — consistent with the ledger doc's own
explicit caveat ("will drift as soon as the next carve/match lands").
Because ov004 itself didn't move while the total shrank, its
*percentage* share ticked up slightly (36.21% → 36.55%, +0.35pp) —
fully explained, not a measurement discrepancy. Tolerance is set at
±1.0 percentage point specifically to absorb this kind of expected,
short-window drift while still catching a real accounting bug (a
mismatch of several points, not a fraction of one).

## 3. Tier assumptions for the tractable-C ceiling

Two tiers, one formula: `ceiling = c_bytes + frac × (c_total - c_bytes)`
— current C stays current, the *remaining* non-C bytes convert at a
fixed, named, per-tier fraction. This (not a flat `frac × c_total`)
guarantees `c_bytes ≤ ceiling ≤ c_total` by construction, so attainment
can never read above 100%.

- **ASYMPTOTIC tier** — hard-coded `{main, ov002}`, not derived. Directly
  sourced from r7-14/r7-15's repeated, "confirmed" (not "plausible")
  finding, independently re-verified here: main + ov002's `.text`-only
  totals are 738,080 + 1,129,252 = 1,867,332 B of EUR's 2,385,948 B
  region-wide `.text` total — **78.3%**, matching r7-14's cited "78% of
  the denominator" exactly. `ASYMPTOTIC_HEADROOM_FRACTION = 0.10`: a
  deliberately small but *nonzero* headroom on the remaining non-C
  bytes. Zero would make attainment tautologically 100% for these two
  modules forever (ceiling == current by definition, unfalsifiable);
  10% reflects that some further conversion keeps landing even here
  (e.g. brief 609's ov002 struct-bank work), just far slower than
  elsewhere. main's residual is reg-alloc-wall-bound
  (`docs/research/codegen-walls.md`'s C-/P-/W- classes); ov002's is a
  project-*priority* decision, not a technical wall — it's already
  100% code%-complete (byte-matched via `.s`), and the c-match campaign
  deliberately converts it selectively (HIGH/MED tiers,
  containment-gated) rather than exhaustively, given its 1.1 MB size.
- **FINISHABLE tier** — every other module. `FINISHABLE_HEADROOM_FRACTION
  = 0.75`: most of the remaining non-C bytes are assumed reachable,
  netting out ~25% for the permanent ISA-instruction floor the ledger
  itself names (mcr/mrc/swi/msr/mrs-carrying `.s`, ~42 EUR/26 USA/26 JPN
  files project-wide — genuinely inexpressible in C) plus per-module
  walls this simpler model doesn't individually census.

**Known, stated divergence from r7-15's own framing:** r7-15 further
narrows the closeable backlog to a *curated* "14 finishable modules
(~92 kB `.s`)" via its own deeper per-module wall census. That census's
raw data (workflow journal `wf_05209332-366`) isn't available to this
brief and isn't reproducible from committed data alone — measured
directly, treating *every* non-asymptotic module as uniformly
"finishable" (this brief's simpler definition) puts **448,000 B** of
remaining non-C bytes in that tier for EUR, roughly 5× the swarm's
92 kB figure for its narrower 14-module subset. That gap is exactly
why this model's 29.56% aggregate lands above r7-14's 14-24% band: it
assumes 75% convertibility across a much larger pool of bytes than the
swarm was willing to vouch for. A future brief with access to (or a
fresh rebuild of) the per-module wall census could tighten
`FINISHABLE_HEADROOM_FRACTION` on a genuinely curated subset instead of
applying one constant uniformly — that would be a real measurement
improvement, not a parameter tune to hit a target number, which this
brief deliberately did not do (see the module docstring in
`tools/progress.py` for the full reasoning trail, including the
several coarser parameterizations considered and rejected along the
way).

## 4. Tests

```
$ python3.13 -m pytest tests/test_progress.py -q
.............................................................................                                        [100%]
77 passed, 28 subtests passed in 0.08s
```

23 new test methods across five classes: `TestDoneClass`,
`TestTractableCeilingBytes` (the ceiling formula, both tiers, the
`ceiling ∈ [c_bytes, c_total]` invariant, the zero-`c_total` edge case),
`TestSummarizeByModuleHonestMetricColumns` (the three new row fields on
realistic fixtures, including a `dtcm`-shaped 0/0 module), `TestCanary
Reconciliation` (the tolerance math pinned against the ledger's own
verbatim 2026-07-16 numbers, a mismatch-detection case, and a
hard-boundary case), and `TestThreeRegionModuleGaps` (the live 3-region
summation, on a synthetic 3-region fixture — kept separate from the
pinned canary math since the *live* repo tree is expected to drift, per
§2).

Full suite: `python3.13 -m pytest tests/ -q` — all green except one
pre-existing, unrelated failure (`docs/research/README.md` stale
against a doc added by a concurrent session before this brief's
worktree was created; not touched by this brief's changes, confirmed
via `git diff --stat` showing zero delta on that file prior to this
brief's own index regeneration in the same commit).

## 5. No sha1 impact

Tools/docs only — `tools/progress.py`, `tests/test_progress.py`,
this doc, and the regenerated tool/research indexes. No `src/`, no
`config/`, no build output touched.
