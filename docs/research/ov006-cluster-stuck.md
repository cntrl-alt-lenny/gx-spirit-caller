# ov006-cluster-stuck

**Asked:** brain noted that two ov006 clusters
(`func_ov006_021c81a4` 44 unmatched LOW, `func_ov006_021b7ce0` 34
unmatched MED) have sat at the top of the unmatched-cluster ranking
across every iteration since #243 — identical numbers across briefs
015, 016, 017, 020 and PR #293's wave 17. Either the predicted yield
is wrong or there's a fingerprint dimension missing. Same research
format as [`hard-tier-clustering.md`](hard-tier-clustering.md) and
[`medium-tier-plateau.md`](medium-tier-plateau.md).

**Short answer:** **the predicted yields are roughly right; the
clusters are roughly wrong.** Both are wildly heterogeneous bags
that the v2 fingerprint cannot subdivide because they have **0
relocs** (cluster #1) or **1 reloc** (cluster #2) — there's nothing
for `(size, [(offset, kind, target_kind)])` to constrain. Across 16
sampled members of cluster #1 we counted **≥15 distinct C shapes**;
across 11 sampled members of cluster #2 we counted **≥8 distinct
shapes**. They have stayed stuck because (a) no brief has piloted
them — every cluster pilot to date picked HIGH or higher-MED
neighbours — and (b) when they *are* piloted, single-anchor
`propagate_template` will deliver ~1/N siblings where N ≈ shape
count, exactly the LOW 20% / MED 61% predictions. Brief 020's
heterogeneous-cluster unlock applies in principle but is currently
manual-labour; the recommended tooling change at the bottom of this
doc is **a per-target shape-template surfacer** that automates the
brief-020 workflow so a decomper can clear 15-shape clusters in a
single wave.

## Method

Snapshot taken on `eur` after PR #298 (post-brief-020 state refresh).
Cluster ranking from `python tools/find_pattern_clusters.py
--version eur --top 8` — top two unchanged across the last five
refreshes:

```
1  func_ov006_021c81a4  size=0x1c  sig=0  matched=1  unmatched=44  ≈20% LOW
2  func_ov006_021b7ce0  size=0x1c  sig=1  matched=2  unmatched=34  ≈61% MED
```

For each cluster: pulled the per-cluster member list via
`tools/find_pattern_clusters.py --version eur ov006 <addr>`,
disassembled the ROM via `./dsd dis`, and read the anchor + a
sample of unmatched siblings spread across modules.

Sample sizes:

- Cluster #1: anchor + 8 main-module siblings + 7 overlay siblings = 16/45 (36%).
- Cluster #2: anchor + 1 other matched + 9 unmatched siblings = 11/36 (31%).

## Cluster #1 — `func_ov006_021c81a4` (size 0x1c, sig=0)

### Anchor

```
func_ov006_021c81a4: ; 0x021c81a4
    str  r1, [r0, #0x54]
    str  r2, [r0, #0x58]
    ldr  r1, [sp, #0x0]
    str  r3, [r0, #0x5c]
    str  r1, [r0, #0x60]
    mov  r0, #0x1
    bx   lr
```

7 ARM instructions, no PC-relative pool word, no calls. Fingerprint
captures only `(size=0x1c, sig=())` — *any* 7-instruction ARM
function with no relocs lands here. Equivalent C:

```c
int store4(struct *s, uint a, uint b, uint c, uint d) {
    s->field_54 = a;
    s->field_58 = b;
    s->field_5c = c;
    s->field_60 = d;
    return 1;
}
```

### Sample unmatched siblings (15 distinct shapes)

| Address                  | Shape (one-line C-equivalent)                                                          |
|--------------------------|----------------------------------------------------------------------------------------|
| `func_0201397c`          | 3-way range classifier `(x<0x90)?0:(x<0xc0)?1:2`                                        |
| `func_020190d0`          | bool range check `(1≤x≤5)?1:0`                                                          |
| `func_02021cbc`          | load-clear-and-test `(*p)?(*p=0,1):0`                                                  |
| `func_02032a18`          | function-pointer dispatcher with stack frame (`if(p->fn) p->fn()`)                      |
| `func_020385bc`          | 4-field initializer (`p->w0=lsl8(x); p->w1=lsl8(x); p->h0=p->h1=0`)                     |
| `func_020566d8`          | 4-field zeroer + return 1 (similar arity to anchor, different offsets/values)           |
| `func_020aaddc`          | signed-byte `strlen`                                                                    |
| `func_020aee3c`          | halfword (wide-char) `strlen`                                                           |
| `func_ov000_021ac770`    | 2-bitfield-op (`f0 &= ~4; f8 \|= 0x40000`)                                              |
| `func_ov000_021ac78c`    | shifted-bit-insert (`f0 = (f0 & ~0x7c) \| ((x<<31)>>29)`)                                |
| `func_ov002_02201c84`    | bitfield-equality (`((f2 >> 6) & 0x3f) == 0x18`)                                        |
| `func_ov002_022ae414`    | guarded array write (`if(r2<0) return; if(arr[r1]!=r2) arr[r1]=r2`)                    |
| `func_ov005_021ab384`    | indexed halfword-and-mask (`(table[r1] & r2) & 0xffff`)                                |
| `func_ov006_021b6d00`    | indexed halfword with cond offset (`base[r1*2 + (r2?0xc66c:0xc662)]`)                  |
| `func_ov006_021c6f24`    | chained-pointer-test (`f3c && f40 ? 1 : 0`)                                            |

**15 distinct shapes among 16 sampled functions.** Shapes share
nothing structurally beyond instruction-count and reloc-count. The
anchor (4-store-then-return-1) appears nowhere else in the sample.

### What `propagate_template` would do

`propagate_template apply --template src/overlay006/ov006_021c81a4.c`
copies the anchor's `.c` to a new file per target and substitutes
reloc indices. With sig=0 there *are no reloc indices to substitute*
— every output file would be a verbatim copy of the anchor's body.
None of the 15 shapes above would byte-match. Predicted yield: 0/44,
plus the "1/N coincidence band" the LOW 20% label is calibrated on.

### Why sig=0 is the worst case for the v2 fingerprint

Cluster fingerprint v2 (per #243) is
`(size_bytes, sorted_tuple_of(offset, kind, target_kind))`. With
sig_len=0 the fingerprint reduces to `(size_bytes,)` — a one-
dimensional bucket. Every leaf-only function of identical byte
length lands in the same cluster regardless of opcodes, register
flow, or constants. Cluster #1 is the canonical example of that
degeneracy at 0x1c bytes; the same shape recurs at other sizes (see
hard-tier-clustering.md's "anchorless mega-clusters" table — 5 such
buckets, 158 functions total, all sig_len=0).

## Cluster #2 — `func_ov006_021b7ce0` (size 0x1c, sig=1)

### Anchor

```
func_ov006_021b7ce0: ; 0x021b7ce0
    ldr    r3, .L_021b7cf8     ; load data_ov006_0224f400
    mov    r0, #0xe
    mla    r0, r1, r0, r3
    lsl    r1, r2, #0x1
    ldrsh  r0, [r1, r0]
    bx     lr
.L_021b7cf8: .word data_ov006_0224f400
```

6 instructions + 1 pool word (= 0x1c). Fingerprint
`(0x1c, [(0x18, load, data)])`. C-equivalent:

```c
struct entry { int16_t arr[7]; };  /* stride 14 = 0xe */
extern struct entry data_ov006_0224f400[];
int16_t lookup(int idx, int sub) {
    return data_ov006_0224f400[idx].arr[sub];
}
```

This is mwcc's idiom for `base[idx].field[sub]` where `sizeof(struct)`
is non-power-of-2 (forces the `mla` rather than a shift-add).

### Other matched function in the cluster

```
func_ov011_021d091c: ; 0x021d091c
    ldr  r0, .L_021d0934      ; load data_021040ac
    mov  r1, #0x17
    str  r1, [r0, #0x3c]
    mov  r1, #0x0
    str  r1, [r0, #0x40]
    bx   lr
.L_021d0934: .word data_021040ac
```

A 2-field initializer to literal values: `data->f3c = 0x17; data->f40
= 0`. **Fundamentally different shape from the anchor** despite
sharing `(0x1c, sig=1, target_kind=data)`.

### Sample unmatched siblings (8+ distinct shapes)

| Address                  | Shape (one-line C-equivalent)                                  |
|--------------------------|----------------------------------------------------------------|
| `func_02001d68`          | bool-set-from-r0 (`*data = (r0>0)?1:0`)                         |
| `func_02006110`          | copy two pool-words to caller-supplied out-pointers             |
| `func_02008598`          | sign-bool getter (`data->f_c >= 0`)                             |
| `func_0201d060`          | positive-bool getter (`data->f_c > 0`)                          |
| `func_02045280`          | nonzero-bool getter (`data[0] != 0`)                            |
| `func_020469b4`          | conditional deref (`data[0] ? data[0]->f_24 : 0`)               |
| `func_02093084`          | bitfield-set (`data[0] \|= 1<<r0`)                              |
| `func_ov002_022028ac`    | eq-test bool (`data[0xcf8] == 2`)                              |
| `func_ov002_02266650`    | eq-test bool (`data[0xd38] == 6`)                              |

8 distinct shapes among 9 unmatched + 2 matched = 11 sampled. The
anchor's `mla`-stride-table-lookup shape appears in **none** of the
sampled siblings. Two pairs of structurally-identical shapes
appeared (the two bool-getters at `02008598`/`0201d060`, the two
eq-test getters at `022028ac`/`02266650`), suggesting the cluster
contains small sub-clusters of 2-4 instances each rather than one
dominant shape.

### What `propagate_template` would do

The single load reloc gets substituted per sibling — its `data_*`
target is replaced with whatever pool word the sibling's reloc table
lists. The anchor's surrounding instructions (`mov #0xe; mla; lsl;
ldrsh`) are emitted verbatim into every output. Only siblings whose
actual instruction stream after the load was already
`mov #0xe; mla; lsl; ldrsh; bx lr` would byte-match — i.e. siblings
sharing the anchor's specific table-lookup shape. From the sample,
**zero such siblings exist** in the unmatched pool.

The predicted MED 61% comes from sibling-arity heuristics that score
higher when a cluster has more matched anchors (cluster #2 has 2 vs
cluster #1's 1). The actual hit-rate from the anchor alone is bounded
above by the count of anchor-shape duplicates in the unmatched pool,
which our sample suggests is 0–2.

## Diagnosis

Both clusters fall in the same diagnostic bucket as brief 020's
`func_02006164` cluster: **heterogeneous-cluster, fingerprint-blind**.
The difference is the *degree* of heterogeneity:

| Cluster | Sig | Sampled members | Distinct shapes | Brief-020-style work |
|---------|-----|-----------------|-----------------|----------------------|
| #1 (`021c81a4`) | 0 | 16 | ≥15  | Per-target hand-shape lookup; ~15 templates needed |
| #2 (`021b7ce0`) | 1 | 11 | ≥8   | Per-target hand-shape lookup; ~8 templates needed   |
| brief 020       | 1 | 23 | 12   | 12 templates (shipped)                              |

Brief 020 unlocked 87% on a 23-member, 12-shape cluster by per-shape
templating — the decomper located a matched-elsewhere function for
each shape and cloned its `.c`. The same approach is *available* for
ov006 #1/#2; it just hasn't been deployed.

**Why the clusters have stayed stuck:**

1. **Yield predictions are accurate for the single-anchor model.**
   `propagate_template`'s "one anchor, sub by reloc index" approach
   really does deliver ~20% on cluster #1 and ~61% on cluster #2. No
   prediction bug.
2. **No pilot has been pointed at them.** Briefs 015/016/017/020/022
   all picked smaller, higher-confidence clusters. Cluster #1's
   sig_len=0 makes it look like the worst-case anchor in the
   ranking, so it gets deferred reflexively.
3. **No tooling shortens the brief-020-style workflow.** Locating
   per-target templates across the matched corpus is currently
   manual: grep the source tree, eyeball the asm, decide which
   matched `.c` is the closest shape clone. For a 15-shape cluster
   that's ~15 manual lookups *plus* the per-shape decomp; the cost
   floor is what makes these sit at the top of the ranking instead
   of getting picked up.

The ov006 prefix is incidental. Both anchors live in overlay 6 by
chance — sampled siblings span main, ov000, ov002, ov004, ov005,
ov006, ov011. There's no overlay-specific pathology here.

## What can move the plateau

Three angles, in increasing order of investment.

### 1. Pilot cluster #2 with brief-020-style multi-shape templating today

Cluster #2 is the cheaper pilot: 8 sampled shapes, 36 total members,
and two of the sampled shapes already have ≥2 instances visible
(strong template candidates). The decomper could in principle clear
a sizable chunk in one wave by drafting the 4-6 most-frequent shapes
and letting `propagate_template` handle the within-shape variants.
Realistic yield band: **40-60% (15-20 of 34 unmatched)**, lower than
brief 020's 87% because the cluster's matched-anchor pool is smaller
(2 vs 12) so per-shape templates have to come from the wider tree.

Cluster #1 should *not* be piloted yet — sig=0 with 15+ shapes is a
worse ratio than even brief 020 and the cluster fingerprint provides
no guidance for shape selection.

### 2. Add a `find_shape_templates` tool (RECOMMENDED)

The brief-020 workflow's bottleneck is **finding the right matched-
elsewhere `.c` to clone for each shape**. A new tool — `tools/find_
shape_templates.py --target <module> <addr>` — would:

1. Disassemble the unmatched target's body (already in the `dsd dis`
   output the decomper has access to).
2. Compute a shape signature: instruction-opcode sequence, with
   immediate-folding (replace `#0x54` etc. with `#imm`), register-
   class normalization (`r0..r3` → arg, `r4..r11` → callee-saved,
   `lr/sp` literal), and reloc-target abstraction.
3. Scan the entire matched corpus (`build/eur/report.json` ∪ `src/
   **/*.c`'s shipped functions) for matched functions that share
   the target's size and have the highest opcode-sequence Jaccard
   similarity.
4. Emit the top-5 matched candidates as a clone-and-adapt worklist:

   ```
   target: func_ov006_021b7ce0 (sig=1, size=0x1c)
     candidate 1 (sim 0.91): src/main/func_02006164.c (brief-020)
     candidate 2 (sim 0.78): src/main/func_020085d4.c (brief-017)
     candidate 3 (sim 0.65): src/overlay000/ov000_021aa4a0.c
     ...
   ```

This converts the per-shape decomp work from "manually grep + read
asm" to "pick from a ranked list, hit-clone, iterate". With the
brief-020 unlock now demonstrated, this is the single highest-
leverage tool addition — it pays back across every future
heterogeneous-cluster pilot, not just ov006.

Estimated scope: ~150-300 lines, single-file. Reuses
`analyze_symbols.py`'s existing module/symbol-graph plumbing for
the corpus walk; the opcode-sequence + similarity scoring is the
new code.

### 3. Add a "shape diversity" score to `find_pattern_clusters` (cheap, low-leverage)

For each cluster, compute the same opcode-sequence shape signature
above and report `shape_count` per cluster. The ranking output gains
a column:

```
1  func_ov006_021c81a4  size=0x1c  sig=0  matched=1  unmatched=44  shapes≈15  ≈20% LOW
2  func_ov006_021b7ce0  size=0x1c  sig=1  matched=2  unmatched=34  shapes≈8   ≈61% MED
```

This documents what's behind the LOW/MED labels and lets the
decomper decide upfront whether a cluster is single-shape (fast
pilot) or multi-shape (brief-020-style investment). Cheap to add
(~30 lines once #2's shape signature exists) but doesn't change
what's matchable — purely informational.

### 4. NOT recommended: refactoring the cluster fingerprint to v3

A v3 fingerprint that includes the opcode-sequence hash would split
cluster #1 into ≥15 sub-clusters of ~1-3 members each. That looks
attractive but **wouldn't help propagation** — the sub-clusters
become singletons, and `propagate_template` already drops singletons.
What `propagate_template` actually needs is the v2 fingerprint *plus*
a way to surface candidate templates from outside the cluster. That's
what proposal #2 does without the rewrite cost.

## Summary

| Question                                         | Answer                                       |
|--------------------------------------------------|----------------------------------------------|
| Is the predicted yield wrong?                    | No. LOW 20% / MED 61% are accurate.          |
| Is there a hidden fingerprint dimension?         | Yes (instruction-shape) but it would only refactor, not unlock. |
| Why are these stuck?                             | Heterogeneous; no pilot picked them; tool ergonomics for multi-shape workflow are missing. |
| Can a decomper unlock cluster #2 today?          | Yes, brief-020 style. Predicted 40-60%.       |
| Can a decomper unlock cluster #1 today?          | Yes but cost-prohibitive without proposal #2. |
| Recommended next move                             | Brief #2 above (`find_shape_templates`), then re-pilot cluster #2, then cluster #1. |

Hand-off: brain decides between (a) queue a decomper pilot on
cluster #2 immediately at the lowered 40-60% expectation, (b) queue
a follow-up cloud brief implementing `find_shape_templates` first
and pilot #1+#2 after, or (c) shelve both clusters until the easier
ranks are drained.
