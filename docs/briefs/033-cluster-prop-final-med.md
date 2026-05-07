### decomper/cluster-prop-final-med

**Goal:** Likely-final easy-tier cluster pilot. Pool has drained to
~10 eligible candidates total; only one passes the selection rule
cleanly.

**Context:**

After brief 030 + its self-extends (PRs #313, #315, #318) + brief
032's research (#317), the cluster ranking has thinned out. Easy
tier sits at 81.3% (902/1110); 56 clusters cover 276 unmatched
functions but most candidates have matched <10 (below the
template-confidence floor). Per the selection rule (MED ≥37%,
matched ≥10):

- **Only viable larger pool:** rank #4 `func_0201397c` — size 0x1c,
  sig 0, **28 matched / 17 unmatched**, 1.65 ratio, MED 37%.
  Strong template confidence; brief-027/028/029/030/030-extend
  trend says MED predictions undershoot 1.5-2x.
- Small-pool option: rank #6 `func_02001d84` — 48/9 = 5.3 ratio
  but only 9 unmatched; brief-029 residue.
- Other top-8 entries fail the matched ≥10 floor.

**Codegen-walls reference is now live** at
[`docs/research/codegen-walls.md`](docs/research/codegen-walls.md)
— grep there first when you hit a partial-match drop. Brief 032's
key finding: ~20% of historic drops were *coercible-but-missed*
under the right C variation. This brief is the first decomper
test of whether that finding pays back.

**Anchor selection (do this when you start):**

1. Run `python tools/find_pattern_clusters.py --version eur --top 8`.
2. If rank #4 `func_0201397c` is still the only matched-≥10 MED
   candidate (likely), pick it. Otherwise apply the rule from
   brief 030.
3. Document the selection trace in PR body.

**Workflow:**

Same as briefs 027-031. find_shape_templates per target, clone
matched-elsewhere `.c`, adapt literals, byte-compare. **Difference
from prior briefs:** when you hit a partial-match drop, grep
`docs/research/codegen-walls.md` for the shape before giving up.
The "Coercible-with-knowledge" section (C-1 through C-8) lists
patterns that have a known C variation — try that variation
before dropping.

15-shape-template cap. Hand-patch cap 3.

**Scope / non-scope / verification gate:** identical to brief 030.

**Success:**

- Lower bound: ≥40% yield (≈7 matches if rank #4 picked, 17
  unmatched pool).
- Higher target: ≥60% (≈10 matches) — that would validate brief
  032's coercible-but-missed finding by reducing the partial-
  match drop rate.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Whether `docs/research/codegen-walls.md` was actually used
    during the work, and which patterns from C-1..C-8 fired.
  - Per-shape template table.
  - Dropped-with-reason list, with each drop classified against
    a codegen-walls bucket (P-N permanent, E-N edge case, or
    a new pattern not yet in the doc).

**Branch:** `decomper/cluster-prop-<addr>` where `<addr>` is the
8-hex address of the chosen anchor.

**After this brief lands:**

1. Brain refreshes state.md + cluster yield track record.
2. **Pivot decision time.** Easy tier will be ~83-85% with this
   brief landed; remaining unmatched are mostly matched-<10
   small clusters. Brain queues either:
   - More easy-tier sweeps (lower-leverage, sub-floor risk).
   - **Medium tier pivot** — 60.3% matched / 62 unmatched is
     a fresh territory and likely has different cluster shapes.
   - A cloud tooling brief implementing T-1 or T-2 from
     codegen-walls.md.

   The codegen-walls drops attribution will inform the choice:
   if T-1/T-2 would unlock ≥10 matches across the remaining
   easy pool, ship that first.
