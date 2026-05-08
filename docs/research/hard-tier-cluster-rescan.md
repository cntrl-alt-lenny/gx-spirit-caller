# hard-tier-cluster-rescan

**Asked:** brief 047 (PR #350) shipped 15 hard-tier matches at
100% yield via individual `find_shape_templates`-assisted
targeting. Recommendation #3 in that PR called for a
re-run of `find_pattern_clusters` focused on hard-tier 0x1c
shapes — the matched corpus has grown ~250+ functions across all
three tiers, and *propagation may compound*. Same research
format as
[`ov006-cluster-stuck.md`](ov006-cluster-stuck.md) /
[`hard-tier-clustering.md`](hard-tier-clustering.md).

**Short answer:** Cluster compounding happened **but not the way
the recommendation expected.** 131 hard-tier unmatched siblings
sit in 35 propagation-eligible clusters now (every cluster has
≥1 matched anchor) — versus 0 propagation-eligible hard-tier
clusters when `hard-tier-clustering.md` first surveyed.
**However**, sample disassembly of three clusters (a HIGH 70%, a
MED 64% size-0x1c, and the lone-hard-sibling rank-#44 cluster)
shows the same heterogeneous-bag pattern brief 023 documented
on the ov006 clusters: identical `(size, sig_len ≤ 2)`
fingerprints hide multiple distinct shapes — different prologues
(r3-spill vs r4-spill vs sp3-style sub-sp), different bodies,
different routing tiers. The compounding effect that's already
working today is `tools/find_shape_templates.py` finding clone-
candidates in the growing matched corpus on a *per-target*
basis — what brief 047 actually used. **A bulk cluster pilot
won't deliver brief-047-style 100% yield.** Recommendation:
don't queue a cluster-pilot brief; continue brief-047-style
individual hard-tier waves with `find_shape_templates` lookup.
The cluster ranking is now a useful *prioritisation* tool
(suggests which hard-tier targets have available templates) but
not a *bulk-shipping* tool.

## Method

Re-ran `python tools/find_pattern_clusters.py --version eur
--top 60 --json` on main `8c34097` (post-brief-047 corpus —
~270+ matched functions across `src/`). Cross-referenced each
cluster against `build/eur/analysis/next_targets.json`'s
per-function tier classification to count how many unmatched
siblings per cluster are in hard tier (the brief's scope).
Sampled three clusters by disassembling the matched anchor and
2-3 unmatched siblings from `_dsd_gap@*.s` to check shape
homogeneity.

## Cluster ranking (post-brief-047)

```text

Total clusters with ≥1 unmatched sibling      :  59
Clusters with ≥1 hard-tier unmatched sibling  :  35
Clusters with ≥1 matched anchor AND
  ≥1 hard-tier unmatched sibling              :  35   ← propagation-eligible
Total hard-tier unmatched in those clusters   : 131

By size band:
  ≤0x10        :   1  (rank-#44 — single sibling)
  0x11-0x20    :  39
  0x21-0x40    :  88
  >0x40        :   3

By predicted yield label:
  HIGH (≥78%)  :  12
  MED  (≥37%)  :  94
  LOW  (≥27%)  :  25
```

Compare to brief 040's pre-pivot snapshot when *zero* hard-tier
clusters had a matched anchor (the matched corpus didn't yet
include hard-tier functions). Brief 047's 15 hard-tier matches
seeded enough anchors that 35 clusters now span both sides. The
"corpus growth compounding" from recommendation #3 is real at
the cluster-discovery level.

### Top hard-tier-eligible clusters by yield + size

HIGH-yield clusters with hard-tier-unmatched siblings:

| Anchor                          | Size | Sig | Matched | Hard-um | Yield |
|---------------------------------|-----:|----:|--------:|--------:|------:|
| `main / func_02018b70`          | 0x24 |   1 |      10 |       5 | 70%   |
| `main / func_0200af08`          | 0x1c |   1 |       8 |       3 | 78%   |
| `main / func_02031e90`          | 0x1c |   2 |       6 |       3 | 78%   |
| `main / func_0200ac2c`          | 0x10 |   1 |      16 |       1 | 78%   |

MED-yield clusters with ≥5 hard-unmatched siblings:

| Anchor                          | Size | Sig | Matched | Hard-um | Yield |
|---------------------------------|-----:|----:|--------:|--------:|------:|
| `main / func_0202b0b4`          | 0x2c |   1 |       1 |      15 | 36%   |
| `main / func_0201967c`          | 0x20 |   1 |       2 |       9 | 63%   |
| `main / func_0200adbc`          | 0x1c |   1 |       2 |       8 | 63%   |
| `ov006 / func_ov006_021b8e1c`   | 0x30 |   1 |       1 |       7 | 38%   |
| `main / func_0202e234`          | 0x24 |   1 |       1 |       6 | 38%   |
| `main / func_0201b7fc`          | 0x30 |   1 |       1 |       5 | 38%   |

The remaining 25 clusters span 1-4 hard-tier-unmatched siblings
each; the per-cluster propagation budget (anchor + a handful of
mechanical clones) can't justify the cluster-pilot overhead at
that ratio.

### Concrete: cluster #8 (`func_0200adbc`, 0x1c) — heterogeneous

The 0x1c-shape cluster brief 047 specifically called out:

```text

Anchor func_0200adbc (matched):
  push {r3, lr}
  mvn r1, #0x3
  mov r2, #0x0
  bl  func_02006c0c       ; 3-arg call
  cmp r0, #0
  moveq r0, #0
  pop {r3, pc}

Hard sibling func_0205c7d8:
  push {r4, lr}            ← r4-spill, NOT r3-spill
  mov r4, r0
  ldr r0, [r4, #0x0]
  bl  func_020453b4
  mov r0, #0
  str r0, [r4, #0x0]
  pop {r4, pc}            ← deref+call+clear, completely different body

Hard sibling func_ov002_021c8470:
  push {lr}                ← sp3-style 1-reg push
  sub  sp, sp, #0x2c       ← sub-sp = sp3 territory (T-3 routing)
  add  r2, sp, #0x0
  bl   func_ov002_021c4c9c
  ldr  r0, [sp, #0x14]
  add  sp, sp, #0x2c
  pop  {pc}                ← Style B 1-step return + sub-sp ⇒ sp3 unique

```

Three siblings, three different shapes, **three different
routing tiers** (default `.c` for the anchor + `0205c7d8`,
`*.legacy_sp3.c` for `ov002_021c8470`). Cluster propagation
can't even pick a single compiler. The fingerprint
`(size=0x1c, sig_len=1)` is too coarse — same lesson as brief
023's ov006 clusters.

### Concrete: cluster #19 (`func_02018b70`, HIGH 70%) — also heterogeneous

```text

Anchor func_02018b70 (matched):
  push {r4, lr}
  mov  r4, r0
  bl   GetSystemWork
  ldr  r2, [r0, #0x8f8]
  lsl  r1, r4, #0x1f
  bic  r2, r2, #0x8000
  orr  r1, r2, r1, lsr #0x10
  str  r1, [r0, #0x8f8]
  pop  {r4, pc}            ← bit-set on global state field

Hard sibling func_0201d6d4:
  push {r3, lr}            ← r3-spill, different prologue
  ldr  r1, .L_0201d6f4
  bl   func_0201d620
  cmp  r0, #0
  ldrne r0, [r0, #0x8]
  lslne r0, r0, #0x1
  moveq r0, #0
  pop  {r3, pc}            ← null-checked deref + bit-shift

```

Different shapes again. Even at 10 matched anchors, the cluster
can't be propagated as a single template.

### Concrete: cluster #44 (`func_0200ac2c`, single hard sibling)

The lone hard-unmatched sibling here is `func_02093294` —
**already covered by brief 048's C-12** (push-r0 thunk via
`asm void` + `nofralloc`). The cluster's matched anchors all
use the conventional `push {r3, lr}; bl; pop` form; the hard
sibling needs the inline-asm escape. Cluster propagation would
mis-route it (use the wrong recipe). Brief 048 already
documented the right path; the cluster ranking surfacing this
target is informational, not actionable as a cluster pilot.

## Why compounding works on `find_shape_templates`, not on clustering

The cluster fingerprint `(size, sig_len)` is by design coarse —
it ignores instruction-class signal entirely (no `push` reg-
list, no body opcode shape, no prologue style). At
`sig_len ≤ 2` (which covers most of the eligible clusters
above), several distinct C shapes share the same fingerprint.
Brief 023 showed this on the ov006 stuck clusters; brief 047
worked around it by using `tools/find_shape_templates.py`
per-target — that tool surfaces clone-candidates by **byte-
level opcode similarity**, not just `(size, sig_len)`. For
hard-tier targets, brief 047's workflow:

1. Pick a hard-tier target.
2. `python tools/find_shape_templates.py --version eur --target
   <module> <addr>` to find shape-similar matched candidates
   anywhere in the corpus.
3. Clone the closest match's `.c`, adapt, build, verify.

This is **per-target compounding**: the matched-corpus growth
makes the `find_shape_templates` lookup return more relevant
clones over time. Brief 047 hit 100% yield this way. The
cluster ranking can hint at *which* hard-tier targets to pick
(prioritise ones in the higher-yield clusters above), but the
match itself goes through `find_shape_templates`, not cluster-
anchor cloning.

## Recommendation

**Don't queue a hard-tier cluster pilot brief.** The
fingerprint-level heterogeneity at `sig_len ≤ 2` (confirmed by
sampling 3 clusters) means cluster propagation will under-
deliver vs the predicted-yield labels. Brief 023 calibrated
this band at ~12-30% on ov006-class heterogeneous clusters; the
hard-tier eligible clusters surveyed here look the same.

Instead, **continue brief-047-style individual hard-tier
waves** using:

1. `find_shape_templates.py` per-target lookup — the working
   compound mechanism.
2. `next_targets.py` for hard-tier prioritisation.
3. Optionally, the cluster ranking above as a hint for *which*
   hard-tier targets are most likely to have matched-elsewhere
   templates available — pick first from the four HIGH clusters
   (12 candidates), then the MED-with-≥5-siblings clusters
   (50 candidates).

The 131 hard-tier-eligible cluster siblings are reachable; the
shipping mechanism is per-target shape templating, not bulk
propagation. Brief 047's 15-match-at-100% pace looks repeatable
for several more waves at this scope.

If the corpus eventually grows enough that `find_shape_templates`
surfaces near-exact-shape matches for >70% of hard-tier targets
(the threshold where bulk propagation starts to look feasible),
revisit. Today the per-target hit rate is well below that — the
matched corpus is large but the hard-tier shapes are diverse.

## What this doesn't change

- **Easy/medium clusters with NON-hard unmatched siblings**
  still propagate cleanly under the existing brief-020/022
  workflow. The 22-easy-unmatched cluster `ov010 /
  func_ov010_021b4750` (rank #3, MED 64%) is the largest
  remaining easy-tier cluster pool — separate scope from this
  brief.
- **`find_shape_templates`'s sig=0 dimension** (brain's
  speculative brief 030+ note about a byte-prefix fingerprint
  for sig=0 clusters) would help here too — but the current
  tool already does opcode-sequence similarity which is the
  right granularity. The hard-tier-cluster heterogeneity isn't
  a tool problem; it's an underlying corpus-shape fact.

## Sources

- `tools/find_pattern_clusters.py --version eur --top 60 --json`
  on main `8c34097` (post-brief-047).
- `build/eur/analysis/next_targets.json` for tier
  classifications.
- Sample disassemblies via `./dsd dis --asm-path /tmp/r0asm`.
- Brief 047 PR (#350) — the 15-match hard-tier pilot.
- Brief 048 PR (#351) — C-12 (push-r0 thunk via `asm void`).
- [`ov006-cluster-stuck.md`](ov006-cluster-stuck.md) — the
  prior-art research note on cluster heterogeneity at
  `sig_len ≤ 1`.
- [`hard-tier-clustering.md`](hard-tier-clustering.md) — the
  earlier hard-tier survey when zero clusters had matched
  anchors.
