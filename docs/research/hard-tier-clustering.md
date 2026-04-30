# hard-tier-clustering

**Asked:** brain noted hard-tier has 8357 unmatched and asked whether
v2 cluster fingerprinting (#243) might surface mega-clusters that
weren't visible under v1. Same research format as
[`medium-tier-plateau.md`](medium-tier-plateau.md).

**Short answer:** v2 finds **170 hard-tier functions immediately
propagatable** from existing matched anchors — about 5× the medium-
tier opportunity (17). The single biggest cluster is 44 functions
(18 matched + 26 unmatched), all `0x18`-byte single-call wrappers.
But the headline is the same as medium-tier: **68% of hard-tier are
structurally unique singletons** that need direct decomp. Hard-tier
is not a tooling problem — it's a slow-grind problem at scale.

## Method

Snapshot taken on `eur` after #243 (cluster fingerprint subdivision)
+ #246 (medium-tier research) merged:

```
Decomp target tiers:
  trivial :   136
  easy    :  1110
  sinit   :    51
  named   :    39
  medium  :   156
  hard    :  8357     ← this doc
```

Hard-tier definition (per `analyze_symbols.classify`):

> A function is **hard-tier** if it has at least one direct callee
> that's still placeholder. Naming the callee promotes the function
> to medium-tier. Match-state independent — a function can be matched
> (in a `complete` TU) and still be hard-tier if its callees haven't
> been named.

Computed v2 fingerprint `(size, [(offset, kind, target_kind), ...])`
for each of the 8357 hard-tier functions. Bucketed by fingerprint;
also collected matched anchors at every fingerprint **across the
whole tree** (not just hard-tier) to find cross-tier propagation
opportunities.

## Distribution

```
fingerprint buckets covering hard tier: 6346

bucket size  count    fns
  singleton  5709    5709    ← 68% of hard-tier
  pair        331     662    ← 8%
  3-5         196     689    ← 8%
  6-10         67     499    ← 6%
  11-50        43     798    ← 10%
  51+           0       0
```

**No mega-clusters > 50 members.** The largest hard-tier cluster has
35 members. Compare: in medium-tier the largest was 11. Hard-tier is
bigger overall, slightly more concentrated, but no order-of-magnitude
new pattern.

## The propagation opportunity: 170 fns with matched anchors

```
hard-tier fns WITH matched anchor at same fingerprint:    170
hard-tier fns WITHOUT matched anchor at same fingerprint: 8187
```

170 / 8357 ≈ 2% — small percentage but **5× the medium-tier opportunity
in raw count** (17 there). Worth a brief.

### Top 10 with-anchor clusters (by unmatched count)

| Rank | Size | Sig | Target kinds | Anchors | Unmatched | Sample anchor |
|-----:|-----:|----:|--------------|--------:|----------:|---------------|
|    1 | 0x18 | 1   | `fn`         |    18   |       26  | `func_020186b0` |
|    2 | 0x2c | 1   | `ext`        |     1   |       16  | `func_0202b0b4` |
|    3 | 0x10 | 1   | `fn`         |    15   |       11  | `func_02018b48` |
|    4 | 0x20 | 1   | `fn`         |     2   |        9  | `func_0201967c` |
|    5 | 0x1c | 2   | `fn` × 2     |     1   |        8  | `func_02031e90` |
|    6 | 0x30 | 1   | `fn`         |     1   |        7  | `func_ov006_021b8e1c` |
|    7 | 0x24 | 1   | `fn`         |     1   |        7  | `func_0202e234` |
|    8 | 0x10 | 2   | `fn` × 2     |     5   |        6  | `main` (entry) |
|    9 | 0x1c | 1   | `fn`         |     5   |        6  | `func_0200af08` |
|   10 | 0x1c | 2   | `fn` × 2     |     8   |        5  | `func_02032f74` |

Cluster #1 is the standout: **44 functions of identical 0x18-byte
single-call-wrapper shape** spread across `main` and `ov002`. With 18
already-matched anchors, the decomper has plenty of templates to
choose from. Naive yield estimate (assuming v2 fingerprint precision
≥ 80%): 20-26 of the 26 unmatched should propagate cleanly.

Cluster #2 is interesting: 1 anchor + 16 unmatched, but the target is
`ext` (unresolved) — the anchor calls into a cross-overlay-swap hole
or gap region. The propagation might still work mechanically since
`propagate_template` substitutes by reloc index, not by target name.

### Concrete: the cluster #1 shape

```
Anchor func_020186b0 (size 0x18):
  arm_call → GetSystemWork (main|0x02018b28, size=0xc)

Unmatched target func_0201cfe0 (size 0x18):
  arm_call → func_0202047c  (placeholder; will get substituted)
```

Both are 0x18-byte wrappers around a single function call. Same
instruction shape (load PC-relative literal, branch via register,
return), different call target. `propagate_template` substitutes the
reloc target by index — output `.c` for the target reads:

```c
extern void func_0202047c(void);

void func_0201cfe0(void) {
    func_0202047c();
}
```

(Or whatever return-shape the anchor's `.c` template uses.)

## The 8187 without anchors

The flip side: **5709 are singleton fingerprints** (no sibling at all,
not even unmatched). The remaining ~2478 cluster among themselves
(pairs and larger) but lack a matched anchor. Most of those clusters
are very small — 8 of the top-20 hard-tier clusters by member count
are singleton-anchor (`matched_at_fp=0`).

### Notable anchorless mega-clusters (sig_len = 0)

The top-20 list includes 5 large clusters with **zero relocs** —
pure leaf functions of identical size, no callouts, no pool words:

| Size | Members | Anchors |
|-----:|--------:|--------:|
| 0x2c |    35   |    0    |
| 0x24 |    33   |    0    |
| 0x28 |    33   |    0    |
| 0x30 |    30   |    0    |
| 0x34 |    27   |    0    |

Together: **158 functions** of identical-size-leaf shape with no
outgoing calls or loads. Distribution for the 0x2c-cluster: 31 in
`main`, 3 in `ov002`, 1 in `ov021`.

These can't be propagated mechanically (no anchor), but they're
**plausibly all instances of one template** — the cleanest brief shape
would be:

1. Decomper picks any one (say `func_0208e4ec`), drafts it by hand
2. Once that one is matched, it becomes the anchor
3. `propagate_template` runs on the other 34

If the v2 fingerprint precision holds, this single brief unlocks 35
matches. Repeated across the 5 sig_len=0 clusters: **158 matches from
5 hand-drafts**. That's the highest-leverage opportunity in hard-tier.

But: **these might not actually be sibling templates**. mwcc could
emit different C bodies that compile to the same byte size with no
relocs (different arithmetic, different bit manipulation). Without
seeing instruction bytes, we can't be sure. The first brief would
serve as the empirical test — if drafting one and propagating
yields > 80%, the bet is paid; if it yields 12.5% (brief 015 redux),
v2 isn't tight enough for this shape.

### Singleton patterns

```
size buckets:
  ≤ 0x40    :  346 fns
  0x41-0x100: 3092 fns
  0x101-0x400: 1936 fns
  > 0x400  :  335 fns
```

Sizes are weighted toward the medium-large body range (0x41-0x400
covers 86% of singletons). These aren't tiny dispatchers — they're
substantial functions doing real computation. The sig_len distribution
spans 0 to 298 (one outlier function with 298 distinct relocs, likely
a giant table dispatch).

These need direct decomp. No tooling shortcut exists.

## What can move the plateau

Three angles, ranked by leverage:

### 1. Brief on cluster #1 (44 single-call wrappers)

Highest immediate yield. 18 matched anchors are already in the tree
— pick one and run `cluster_wave_propagate`. Expected outcome under
v2 fingerprint: 20-26 of 26 unmatched siblings match cleanly.

Brief 016 (`func_ov000_021aa4a0`) had 26 unmatched siblings; the same
flow applies here. Estimated decomper cost: similar to brief 015/016
(~1 day per wave).

### 2. Pilot the anchorless sig_len=0 mega-clusters

The 5 large no-reloc clusters (158 fns total) are speculative — but
if they pan out, a single hand-draft unlocks 27-35 matches per
cluster. Best ROI bet in hard-tier.

Recommended approach: **start with the smallest cluster (0x34, 27
members)** to limit risk. If yield > 80%, scale to the bigger ones.
If yield is brief-015-level (~12.5%), the v2 fingerprint is too
coarse for sig_len=0 leaves, and a follow-up tooling refinement is
needed (the doc-flagged `--anchorless` mode in #246 + an instruction-
byte signal cloud doesn't currently have access to).

### 3. The 5709 singletons need direct decomp

Same conclusion as medium-tier-plateau.md: no algorithmic shortcut.
Tools that help drafting (`scratch_bundle`, `m2ctx`,
`bulk_rename_candidates`) compress the per-function loop, but the
work has to happen.

At current cadence (~10-20 hard-tier matches per wave), processing
the 5709 singletons would take **months of decomper time**. The
realistic frame: clear the 170 with-anchor opportunities in 5-8 brief
waves, then the hard-tier becomes a long-tail singleton grind.

## Tool gap surfaced

Same one-line gap as #246 flagged: **`--anchorless` mode in
`find_pattern_clusters`**. Currently the tool drops clusters with
`matched=0` from output. The 158-fn sig_len=0 mega-cluster opportunity
above is exactly the case it would surface.

Would also help with the medium-tier 17-fn opportunity (#246's
finding). One ~50-line tool addition; pays back across both research
findings.

## Summary

| Bucket                                     | Count | Action                              |
|--------------------------------------------|------:|-------------------------------------|
| With matched anchor (clusters 1-36)        |   170 | Run cluster_wave_propagate          |
| Anchorless mega-clusters (sig_len=0, top 5)|   158 | Pilot: hand-draft 1, propagate 158  |
| Other anchorless clusters (≥ 2 members)    |  2320 | Pilot per cluster, low ROI usually  |
| Singletons                                 |  5709 | Direct decomp, no shortcut          |
| **Total**                                  | **8357** |                                  |

Hard-tier is grindable, but the immediately-leverageable opportunity
(170 + speculative-158) is well-bounded. Beyond that, it's
function-by-function work.
