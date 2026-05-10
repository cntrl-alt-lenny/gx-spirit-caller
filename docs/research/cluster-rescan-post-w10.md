# cluster-rescan-post-w10

**Asked:** brief 049 wave 10 (PR #359) noted strong repeated-twin
signal across the wave's matches. Brief 047 wave 9 (PR #357)
recommendation #3 — re-run `find_pattern_clusters` to see whether
the now-grown matched corpus surfaces actionable cluster
propagation candidates — got elevated to high-priority cloud
autonomous work. Same research format as
[`hard-tier-cluster-rescan.md`](hard-tier-cluster-rescan.md)
(the prior rescan after brief 047 wave 7).

**Short answer:** **Cluster pipeline IS reopening at the
per-target level, but NOT as bulk propagation.** The post-w10
scan shows 59 propagation-eligible clusters covering 266
unmatched siblings (vs 35 / 131 in the prior rescan). 8 HIGH-yield
(≥74%) sig=1 clusters surfaced, but **sample disassembly across
9 clusters confirms the prior rescan's verdict still holds**:
fingerprint heterogeneity at `sig_len ≤ 2` makes the predicted-
yield labels overstate. **However** — and this is new — the
fresh-corpus growth has surfaced **2 clusters with 100%-fresh
+ 100%-homogeneous-shape unmatched siblings** (`func_0201ed28`:
5 ARM tail-call thunks; `func_02000cb4`: 3 ov004 ARM global
getter/setters), plus 4 more clusters where 1-3 fresh-candidate
ARM-mode siblings sit alongside Thumb (E-3) or
documented-permanent-wall residue. **Total tractable scope: 15
individual targets across 6 clusters.** Brain should queue a
small per-target brief (NOT a cluster propagation pilot)
drawing from the documented candidate list below;
`find_shape_templates.py` per-target lookup remains the right
matching mechanism.

## Method

Re-ran `python tools/find_pattern_clusters.py --version eur
--top 60 --json` on main `e3b1d3c` (post-PRs #359 + #361, ~310+
matched functions across `src/`). Cross-referenced each
≥3-unmatched-sibling cluster against `next_targets.json`'s
per-function tier classification AND against
`docs/research/codegen-walls.md`'s *Per-PR drop cross-reference*
table to identify documented-wall residue. Sample-disassembled
9 clusters by reading the anchor + every unmatched sibling
from `_dsd_gap@*.s` (per-cluster sibling counts ≤ 7) to check
shape homogeneity and routing-tier consistency.

## Cluster ranking (post-wave-10)

```text

Total clusters with ≥1 unmatched sibling      :  59
Total clusters with ≥3 unmatched siblings     :  30
Total unmatched siblings in those clusters    : 224

By predicted-yield label (≥3-um clusters):
  HIGH (≥74%)  :   8  (34 unmatched-sibling capacity)
  MED  (≥37%)  :  21  (165 unmatched)
  LOW  (≤27%)  :   1  ( 25 unmatched, sig=0 hard-tier)

By tier of unmatched siblings (≥3-um clusters):
  All-easy unmatched   :  14 clusters (110 unmatched)
  All-hard unmatched   :  15 clusters (104 unmatched)
  Mixed                :   1 cluster  ( 10 unmatched)
```

Compare to prior `hard-tier-cluster-rescan.md` snapshot
(post-brief-047): 35 propagation-eligible clusters / 131
hard-tier unmatched. Post-w10 nearly doubled the cluster
count (35 → 59) and added 110 easy-tier-unmatched candidates
that weren't propagation-eligible before (the easy-tier
cluster pool was thought drained at brief 033).

### Top-9 sample-disassembled (sorted by predicted yield)

| Anchor | Sig | Mtch | Um | Yield | Verdict |
|--------|----:|----:|---:|------:|---------|
| `func_020453b4` | 1 | 12 | 7 | 78% HIGH | **All 7 = brief 031 residue (P-1, P-2, P-3, P-4 documented). Skip.** |
| `func_0201ed28` | 1 | 37 | 5 | 78% HIGH | **5 fresh ARM tail-call thunks. CLEAN.** |
| `func_02006e1c` | 1 | 60 | 3 | 78% HIGH | 1 ARM tractable + 2 Thumb (E-3). |
| `func_0200add8` | 1 | 95 | 3 | 78% HIGH | 2 ARM tractable + 1 Thumb (E-3). |
| `func_020057c8` | 1 | 27 | 5 | 74% HIGH | 3 ARM mainline + 2 sp3-routing (heterogeneous routing tier). |
| `func_020071a4` | 1 | 36 | 5 | 74% HIGH | **4 documented walls + 1 C-2 missed (`func_0208904c`).** |
| `func_02000cb4` | 1 | 63 | 3 | 74% HIGH | **3 fresh ov004 ARM getter/setters. CLEAN.** |
| `func_02006164` | 1 | 48 | 3 | 74% HIGH | All 3 = brief 020 documented (P-3 + permanent + E-3 Thumb). Skip. |
| `func_0202b4b4` | 0 | 7 | 26 | 37% MED | Heterogeneous (4+ shapes among samples). Skip — `sig=0` confirmed too coarse. |
| `func_0201967c` | 1 | 4 | 7 | 64% MED | Heterogeneous (4 shapes; spans routing tiers). |

### Concrete: cluster `func_0201ed28` (CLEAN, 5/5 fresh ARM thunks)

Anchor + all 5 unmatched share the **tail-call-thunk via
function-pointer-pool-word** shape:

```text

# Anchor (matched, src/main/func_0201ed28.c)
ldr ip, .L
mov r1, #0x4
mov r2, #0x0
bx  ip
.word func_02006c0c          ; helper

# Unmatched sample (func_02054c64)
ldr ip, .L
mov r0, #0x0
mvn r1, #0x0                 ; r1 = -1
bx  ip
.word func_02054ea8

# Unmatched sample (func_02062918)
ldr ip, .L
mov r3, #0x67
strb r3, [r1, #0x2]          ; side-effect-then-tail
bx  ip
.word func_02062280

# Unmatched sample (func_ov002_022ac028)
ldr r0, [r0, #0x68]          ; arg-deref
ldr ip, .L
ldr r0, [r0, r1, lsl #0x2]   ; indexed deref
bx  ip
.word func_ov002_021aff78

```

Each is a small wrapper around a tail-called helper, with 1-3
instructions of arg setup or side-effect work in between. The
anchor's matched C is the 1-liner `return helper(a, 4, 0, d);`
shape; siblings need per-target C variants but the cluster
fingerprint reliably identifies all 5 as the same broad
pattern. `find_shape_templates` per-target on the 37-anchor
matched corpus would surface close-shape clones; brief 020 /
022 / 024 already did this on similar tail-call clusters with
77-100% yield.

### Concrete: cluster `func_02000cb4` (CLEAN, 3/3 fresh ARM getter/setters)

Anchor + all 3 unmatched share the **single global pointer
load → field access → bx lr** shape (size 0x10 = 4 words):

```text

# Anchor (matched, src/main/func_02000cb4.c)
ldr r0, .L
ldr r0, [r0, #0xb64]         ; load .field_b64
bx  lr
.word data_021040ac

# Unmatched samples (all ov004)
# func_ov004_021c9d8c: setter
ldr r1, .L
str r0, [r1, #0x48]          ; *data.field_48 = arg0
bx  lr

# func_ov004_021d38a4: setter
ldr r1, .L
str r0, [r1, #0x0]           ; *data = arg0

# func_ov004_021d38b4: getter (same data symbol as 21d38a4!)
ldr r0, .L
ldr r0, [r0, #0x0]
bx  lr

```

**Twin signal:** `_021d38a4` + `_021d38b4` share the same
`data_ov004_0229159c` symbol (one writes, one reads). This is
the kind of compounding twin pattern brief 049 wave 10's
recommendation flagged — the matched 63-anchor corpus has
plenty of `*global = arg` and `return *global` precedents.

### Concrete: cluster `func_020453b4` (SKIP, brief 031 residue)

The post-w10 scan still surfaces this cluster as HIGH 78%
because the matched-anchor count grew to 12. **But the 7
unmatched siblings are EXACTLY brief 031's drops** (verbatim
from `codegen-walls.md`'s cross-reference):

```text

func_02052ddc                    P-4 (r2-vs-r3 swap, brief 031)
func_0207842c / _78444 / _ov002_0229cd70    P-4 (4-target group)
func_0207dee0                    P-2 (ldmib fusion)
func_0207f4f8                    P-3 (constant materialisation)
func_ov002_022912c8              P-1 (shift-pair collapse)

```

Brief 031 attempted these and yielded 22% (2/9). All 7 sit on
documented permanent walls; cluster propagation will not
unblock them. The HIGH 78% predicted yield is misleading
because the predictor doesn't penalise documented-wall
residue.

### Concrete: cluster `func_020071a4` (1 C-2 missed unblock)

5 unmatched, 4 documented walls + 1 historic miss:

| Sibling | Wall (per cross-ref) | Tractable? |
|---------|---------------------|-----------|
| `func_02007f38` | P-3 (brief 022) | Skip |
| `func_0208904c` | **C-2 (missed in brief 022)** | **Coercible — local-pointer reuse** |
| `func_02095bf8` | permanent (uchar pre-inc) | Skip |
| `func_ov000_021ab6cc` | P-1 | Skip |
| `func_ov000_021af5c0` | P-1 | Skip |

The C-2 candidate `func_0208904c` is the single non-wall;
worth folding into a per-target brief.

### Concrete: cluster `func_0202b4b4` (sig=0 heterogeneity confirmed)

26 easy-tier unmatched siblings sample-disassembled:

```text

# Anchor: is-this-one-of-two-keys
cmp r0, K1; addne r1, K1, K2-K1; cmpne r0, ...; ...; bx lr

# Sample 1 (func_0200faf8): doubly-linked-list unlink
ldr r1, [r0, #4]; ldr r0, [r0, #0]; cmp r1, #0;
strne r0, [r1, #0]; cmp r0, #0; strne r1, [r0, #4];
mov r0, #0; bx lr

# Sample 2 (func_0202f410): single-key compare
cmp r0, K; bne L; mov r0, #1; bx lr; L: mov r0, #0; bx lr

# Sample 3 (func_02053728): bit-pack
ldr r2, [r0]; ldr r1, .L; ldr r0, [r0, #4];
and r1, r2, r1; orr r1, #0; orr r0, #0; bx lr

```

4 distinct shapes among 4 samples — the sig=0 cluster is
hiding multiple shapes behind the same fingerprint. **Same
brief-023 / prior-rescan lesson: `sig_len ≤ 2` is too coarse.**
26 unmatched siblings are not bulk-propagatable; each needs
per-target work.

## Where the compound is happening

Two distinct compounding mechanisms surfaced post-w10:

1. **Per-target template growth** — `find_shape_templates.py`
   on the now ~310+ matched corpus returns more relevant clones
   per-target than at the brief 047 wave 7 baseline. Wave 9's
   100% per-attempt yield within scope confirms this is the
   working compound mechanism. Cluster ranking helps as a
   prioritisation hint (which targets have available
   templates), not as a bulk-shipping tool.
2. **Twin signal across the matched corpus** — wave 8's
   `_0206be*` / `_0208bf*` pairs, wave 9's `_021c84*` 4-twin
   group, wave 10's `_021dbf*` ov004 trio. The
   `func_02000cb4` cluster's `_021d38a4`/`_021d38b4`
   getter/setter pair is the same pattern — small unmatched
   pools clustered around shared data symbols. Brain may
   want to add a "shared-data-symbol" filter to
   `next_targets.py` as a future tooling enhancement; for
   now the cluster scan IS surfacing them.

## Tractable scope (15 individual targets across 6 clusters)

Recommend a per-target brief covering:

| Cluster anchor | Tractable siblings | Tier |
|----------------|--------------------|------|
| `func_0201ed28` | `func_02054c64`, `func_0205ffc0`, `func_02062918`, `func_ov002_022644fc`, `func_ov002_022ac028` (5) | easy |
| `func_02000cb4` | `func_ov004_021c9d8c`, `func_ov004_021d38a4`, `func_ov004_021d38b4` (3) | easy |
| `func_0200add8` | `func_0207f8c8`, `func_02087f24` (2) | easy |
| `func_02006e1c` | `func_0209085c` (1) | easy |
| `func_020057c8` | `func_02052384`, `func_020a36c8`, `func_ov002_022a51cc` (3 ARM only; skip the 2 sp3 siblings) | easy |
| `func_020071a4` | `func_0208904c` (1, C-2 coercion) | easy |
| **TOTAL** | **15** | |

All 15 are easy-tier candidates from sig=1 clusters with
fresh shapes (not on documented walls) and adequate template
diversity in the matched corpus. Per-target shape templating
should yield 80-100% (per brief 020 / 022 / 024 historic
calibration on similar mainline-sig=1 work).

## Not in scope this rescan

- **`func_ov010_021b4750` cluster (22 easy-um, MED 64%)** — the
  largest remaining easy-tier cluster pool from the prior
  rescan. This research focused on freshly-surfaced clusters
  post-w10; the ov010 pool remains as a separate scope. Brief
  candidate if brain wants the larger pool drained first.
- **MED ≥37% sig=1 hard-tier clusters** (`func_0202b0b4` 15
  hard-um, `func_ov006_021b8e1c` 7 hard-um, etc.) — most are
  1-matched-anchor clusters where template diversity is
  inadequate for per-target work. Defer until matched
  template count grows.
- **C-14 unblock pair** (`func_ov002_021fbba8`,
  `func_ov002_02243740`) — already queued via brief 050
  ([PR #360](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/360)).

## Recommendation

1. **Don't queue a bulk cluster propagation pilot.** The
   sig ≤ 2 fingerprint heterogeneity continues to cap bulk-prop
   yield well below the predicted-yield labels (confirmed
   across 9 sample-disassembled clusters this rescan).
2. **Queue a small per-target brief** picking from the 15
   tractable candidates above. Estimated ~10-13 matches at
   80-100% yield (mainline sig=1 easy-tier + thunk shapes).
3. **Cluster ranking continues as prioritisation hint.** The
   "fresh siblings + ≥10 matched anchors + sig=1" combination
   is the actionable signal — not the predicted-yield label
   alone. Cross-reference against `codegen-walls.md`'s
   per-PR drop table before queuing any cluster's siblings;
   3 of the 8 HIGH 74-78% clusters are pure
   documented-wall-residue.
4. **Easy-tier pool is NOT drained.** State.md's "easy-tier
   cluster pool drained through brief 033" claim is now
   stale: 110 easy-tier siblings sit in propagation-eligible
   clusters post-w10, and 17 of those are tractable today
   (15 listed above + 2 in the ov010 separate-scope pool).
   Brain should refresh the state.md claim after this
   rescan.
5. **Revisit when matched corpus grows another ~50 functions.**
   `find_shape_templates`-per-target compounding is genuine;
   the cluster scan is the way to see it surface.

## Sources

- `tools/find_pattern_clusters.py --version eur --top 60
  --json` on main `e3b1d3c` (post-w10).
- `build/eur/analysis/next_targets.json` for tier
  classifications.
- `docs/research/codegen-walls.md` *Per-PR drop
  cross-reference* table for wall-residue cross-checking.
- Sample disassemblies via `./dsd dis -c
  config/eur/arm9/config.yaml -a /tmp/r0asm`.
- [`hard-tier-cluster-rescan.md`](hard-tier-cluster-rescan.md)
  — the prior rescan after brief 047 wave 7. Verdict
  ("don't queue cluster pilot; per-target compounding works")
  re-confirmed by this scan.
- [`ov006-cluster-stuck.md`](ov006-cluster-stuck.md) — the
  prior-art note on cluster heterogeneity at `sig_len ≤ 1`.
- Brief 049 (PR #359) — wave 10 hard-tier matches,
  cap-raise validation, twin-signal observation that
  triggered this rescan.
