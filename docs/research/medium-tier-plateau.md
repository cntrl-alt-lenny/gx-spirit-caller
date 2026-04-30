# medium-tier-plateau

**Asked:** brain noted the medium tier has been flat at 94/156 (94 matched
of 156 total medium-tier candidates, 62 still unmatched) for 4+ waves.
Are the remaining 62 genuinely harder, or is there clustering opportunity
that hasn't surfaced?

**Short answer:** the plateau is **mostly structural, not tooling-fixable**.
**45 of the 62** unmatched medium-tier functions (73%) are singleton
fingerprints with no matched-anchor cluster — they need direct decomp,
no shortcut available. **17 are clusterable among themselves** (14 in
pairs + 3 in one triple) — the decomper can draft one of each cluster
and `propagate_template` to the rest. There's a tooling angle to
surface those 17, but the bulk of the plateau is genuine
function-by-function work.

## Method

Snapshot taken on `eur` after PR #243 merge (cluster fingerprint
subdivision):

```
Decomp target tiers:
  trivial :   136
  easy    :  1110
  sinit   :    51
  named   :    39
  medium  :   156    ← brain's "94/156"
  hard    :  8357
```

The medium-tier population (156) is the count of currently-eligible
medium-tier candidates per `analyze_symbols.classify`:

> A function is medium-tier if `size ≤ 0x80` and every direct callee
> is named, and the function itself is still placeholder.

Of these 156:
- **94 are inside `complete` TUs in delinks.txt** — already matched,
  just waiting on a rename to leave the tier.
- **62 are still unmatched** — the actual plateau.

Brain's 94/156 = "how many medium-tier candidates are matched."

This doc analyzes the 62 unmatched.

## Distribution of the 62

```
by module:
  main    52      ← dominant
  ov006    3
  ov011    3
  ov005    1
  ov000    1
  ov007    1
  itcm     1

by size:
  0x21–0x40  : 17
  0x41–0x60  : 22
  0x61–0x80  : 23
```

Sizes are **evenly spread across the medium-tier range**. Nothing
accumulating just below the 0x80 cap, no concentration at small sizes.
Mostly clustered in `main` because main is where most of the runtime
mid-complexity code lives.

## Cluster analysis under the v2 fingerprint (#243)

Fingerprinting all 62 unmatched medium-tier functions with the v2
`(size, [(offset, kind, target_kind)])` signature:

```
fingerprint buckets covering the 62 unmatched fns:
  singleton   :  45 buckets, 45 fns       ← 73%
  pair        :   7 buckets, 14 fns       ← 23%
  triple+     :   1 bucket,   3 fns       ← 5%
```

**73% of stuck mediums are structurally unique** — no other unmatched
sibling shares their `(size, sig)` shape, and **only 1** has a matched
anchor at the same fingerprint anywhere in the tree.

So even with the v2 cluster tooling, the propagation lever can move
**at most 17 functions** (the 14 pairs + the 3 triple, drafting one of
each cluster as a template).

The other 45 need direct decomp.

### What the singletons look like

Of the 45 singleton fingerprints:

```
sig_len:  1 reloc  → 12 fns
          2 relocs → 13
          3 relocs →  8
          4 relocs →  6
          5 relocs →  6

target_kind (sum across 116 relocs in the 45 singletons):
  fn   : 79       ← function-call targets
  ext  : 34       ← unresolved (cross-overlay-swap holes, gap regions)
  d4   :  3       ← small-data targets
```

Two things stand out:

1. **They're heavily call-shaped.** 79 / 116 ≈ 68% of relocs target
   functions. These aren't singleton-pointer-getters or simple data
   shims — they're **dispatchers, wrappers, state-machine drivers**
   with multiple call-outs. That's why the v1 cluster propagation pilot
   missed them: instruction shape varies too much for the brief
   015-style "single template" approach.

2. **34 ext (unresolved) relocs.** These are calls into modules whose
   target symbol doesn't resolve — typically cross-overlay-swap holes
   (per `--allow-unknown-function-calls` workaround in CLAUDE.md) or
   into gap regions. **Resolving these would in some cases promote a
   stuck-medium to a "draftable" state** by giving the call-out a real
   identity, but that's `dsd init` analysis territory, not cloud's.

### Concrete examples

#### Singleton — `func_02018b48` (size 0x10, sig_len 1)

```
size : 0x10
relocs:
  src=0x02018b4c  arm_call → GetSystemWork (main|0x02018b28)
```

A 16-byte single-call wrapper. Likely shape:

```c
SystemWork *func_02018b48(void) {
    SystemWork *sw = GetSystemWork();
    return /* ... do something with sw, return result */;
}
```

The call-target is named (`GetSystemWork`), so this IS in the medium
tier, but the wrapper's body shape is unique — no other unmatched
function in the corpus does exactly this.

#### Triple — `func_02024574` / `func_020270d0` / `func_02028790` (size 0x74, sig_len 3)

```
each function:
  arm_call  → main|0x020944c0  (same call target across all 3)
  load      → main|0x0219a8ec / 0x0219a924 / 0x0219a92c (different data, same shape)
  load      → main|0x0219a8ec / 0x0219a924 / 0x0219a92c (same as above — repeated)
```

**Classic varying-data dispatcher pattern**. All three call the same
function (presumably a registered handler) and load from different
data slots. Same instruction shape, different data targets. Drafting
one and `propagate_template`'ing to the other two **should land at
~100% match rate** under the v2 fingerprint.

This is the clearest unstuck-medium opportunity in the bunch.

## What can move the plateau

Three angles, ranked by leverage:

### 1. Surface the 17 anchorless-cluster candidates as a worklist

The decomper currently runs `find_pattern_clusters` with the implicit
filter "matched anchor exists." When no anchor exists, the cluster
drops out of the report. But for the 17-fn opportunity, **the decomper
doesn't yet know which 17** without running this analysis.

**Tooling fix:** add an `--anchorless` mode to `find_pattern_clusters`
that surfaces clusters with `matched=0, unmatched≥2`. The decomper
picks one per cluster to draft, then propagates.

Estimated payoff: 17 fns / 62 = 27% reduction in the unmatched-medium
count if every cluster propagates cleanly. Realistic with v2
fingerprint precision ≥ ~80%.

### 2. Resolve the 34 ext-target relocs

Each unresolved `ext` reloc inside a stuck-medium is a function call
whose callee identity is unknown (likely cross-overlay-swap or gap-
region). For some of these:

- The callee may be a placeholder that's callable but not in the
  symbols table → fixable by extending `dsd init` analysis (upstream)
- The callee may be a real function in a module that's in the
  symbols table but at an addr that didn't get classified →
  potentially fixable by patching the symbols.txt manually

Investigating each `ext` is per-callee detective work. Probably
unlocks 5-15 of the 45 singletons by promoting their `ext` relocs to
real targets — but no guarantee.

### 3. Direct decomp of the 45 singletons

The remaining work is per-function, no algorithmic shortcut. Tooling
that helps:

- `tools/scratch_bundle.py` — context bundles for decomp.me / drafting
- `tools/m2ctx.py` — preprocessed C context for the permuter
- `tools/bulk_rename_candidates.py` — once one is drafted, find renamed
  siblings to propagate naming (not body match)

Wave-of-2-3 PRs at a time. Estimated 1-2 months of decomper time at
current cadence.

## Recommendation

Brain's option (research-only) is the right read: **the plateau is
not a tooling crisis**. It's the natural shape of a long-running
decomp project as the easy patterns get drained.

The one tooling addition that would move the needle: **`--anchorless`
mode in `find_pattern_clusters`** (angle #1 above), which would surface
the 17-fn opportunity as an explicit worklist. That's a ~50-line
addition; cloud-tractable; would compound across future plateau
patterns too.

The 45 singletons need direct decomp work. No shortcut to ship.
