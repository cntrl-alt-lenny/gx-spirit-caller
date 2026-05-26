[//]: # (markdownlint-disable MD013 MD041)

# Brief 228 — C-39 drain wave 3 (a/b sub-shapes)

**Brief:** 228 (decomper). Apply brief 227's uniform-sub-shape
playbook to the C-39a/C-39b cohorts. Target 20-30 ships,
hard-tier 6.4% → 6.7-7.0%.

## Headline

**31 .c ships → hard-tier matched 6.4% → 6.8%** (547/8351, +31).
All in `src/overlay002/`. All 31 byte-identical on first attempt.

Cohort breakdown:
- 2 picks at size 0x24 — brief 227's bool-from-helper leftovers (`< 0` / `<= 0` cond pair).
- 20 picks at size 0x28 — brief 227 shape + one extra arg-setup insn.
- 7 picks at size 0x2c — brief 227 shape + two extra body insns (3-arg helper + literal).
- 2 picks at size 0x34 — new **2-helper pipeline** shape.

`complete_units +31`. 3-region SHA1 PASS preserved (EUR/USA/JPN).

## Strategy: continue brief 227's uniform-shape methodology

Brief 226 added C-39a (sign-check) and C-39b (helper-reuse) detectors
that fire as sub-flags alongside the base C-39. Cohort counts (unshipped):

| Cohort | Picks |
|---|---:|
| C-39 + C-39a only | 19 |
| C-39 + C-39b only | 297 |
| C-39 + C-39a + C-39b | 21 |
| C-39 alone (no sub-shape) | 1072 |

The biggest by far is **C-39 alone** (1072 picks). Brief 227 drained
19 of these. The reason most C-39 picks have no sub-shape flag:
neither detector fires when the function is the bool-from-helper
shape (no `movs r1, r0; bmi`, no `mov rD, r0` after first bl).

So this wave **continues mining the C-39-alone cohort** for brief
227's bool-from-helper shape, extending the recipe with:

- helper arg-pattern variants (+1 const, +1 invert, +2 args, etc.)
- the new 2-helper pipeline shape (helper1 then helper2)

## Sample size justification

Within C-39b solo (297 picks), shape diversity is enormous —
allocator-flag, double-helper-compare, early-return-on-bool, etc.
Strict-clone scans found only 2-shape pairs and 0 exact clones of
brief 226's worked examples. The "C-39b solo" detector flag is a
*codegen* signature, but the *source* shapes are non-uniform.

By contrast, the C-39-alone cohort still has clean bool-from-helper
sub-shapes ready to drain — found 33 picks across sizes 0x28-0x30 with
a uniform tail signature.

## Recipe library (this wave)

All variants use the brief 222 bitfield-struct + brief 227 bool-tail
foundation:

```c
struct FXXX_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct FXXX_Self {
    unsigned short f0;
    struct FXXX_F2 f2;
};
```

### V0 — single-arg bool-from-helper (brief 227 shape)

```c
return helper(self->f2.bit0) <CMP> N;
```

Ships: `02292b88` (`< 0`), `022958f8` (`<= 0`). These are brief 227's
leftover cond-codes (`mi/pl`, `le/gt`).

### V1 — helper(bit0, -1)

```c
return helper(self->f2.bit0, ~0) <CMP> N;
```

Helper takes 2 args; `~0` emits `mvn r1, #0`. Ships: 3 picks
(021ff668, 021ff710, 02203648).

### V2 — helper(1 - bit0)

```c
return helper(1 - self->f2.bit0) <CMP> N;
```

`1 - bit0` emits `rsb r0, r0, #1` after the bitfield extract. Ships:
**11 picks** (022022f0, 02204964, 02288654, 02291418, 02291440,
02291ed8, 022923a8, 02294054, 02296728, 02296750, 02296778).

This is the dominant variant in the wave 3 cohort.

### V3 — helper(bit0, K)

```c
return helper(self->f2.bit0, K) <CMP> N;
```

Helper takes 2 args; K is a small literal. Ships: 3 picks (0220829c
with K=1, 02294ebc with K=5, 022926d0 with K=0).

### V4 — helper(self, 1 - bit0)

```c
return helper(self, 1 - self->f2.bit0) <CMP> N;
```

Two-arg helper where self stays live in r0 and `1-bit0` goes into r1
(via `ldrh r1; lsl r1; lsr r1; rsb r1, r1, #1`). Ships: 3 picks
(0220b0f8, 02288474, 02291114).

### V5 — helper(bit0, f0, 0)

```c
return helper(self->f2.bit0, self->f0, 0) <CMP> N;
```

3-arg helper using both bit0 and self->f0 plus a literal 0. mwcc emits
`ldrh r3, [r0, #2]; ldrh r1, [r0]; mov r2, #0; lsl r0, r3, #31; lsr r0, r0, #31`.
Ships: 3 picks (02201a40, 02203aec, 02206fe4).

### V7 — helper(self, bit0, -1, 0)

```c
return helper(self, self->f2.bit0, ~0, 0) <CMP> N;
```

4-arg helper. r1 channel for bit0; r2 = -1; r3 = 0. Ships: 1 pick
(022943c4).

### V8 — helper(bit0, K, f0)

```c
return helper(self->f2.bit0, K, self->f0) <CMP> N;
```

3-arg with literal in middle position. Ships: 1 pick (02295178,
K=11).

### V9a/V9b — helper(1-bit0, 1) / helper(self, 1-bit0, 1)

```c
return helper(1 - self->f2.bit0, 1) <CMP> N;          /* V9a */
return helper(self, 1 - self->f2.bit0, 1) <CMP> N;    /* V9b */
```

Compose V2/V4 with an additional literal const. Ships: 2 picks
(02291810 V9a, 02296594 V9b).

### Shape α — 2-helper pipeline (NEW sub-shape)

```c
int n = helper1(self);
return helper2(self->f2.bit0, self->f0, n) <CMP> N;
```

Two `bl` instructions with the first helper's return becoming an arg
to the second. mwcc 2.0 schedules the bitfield extract between the
two calls. Ships: 2 picks (02291214 `> 0`, 02295144 `>= 2`).

This shape was found in the C-39b-solo cohort but is otherwise
isomorphic to the bool-from-helper family — same tail
(`cmp; movCC; movNCC; pop`), just with an extra pipeline step.
Worth surfacing as a brief 230+ scaffolder candidate for formal
sub-classification.

## Why C-39a was skipped this wave

C-39a-solo cohort has 19 picks. Sampling the smallest 6 (sizes
0x54-0x6c) showed they involve complex address arithmetic — `mla`
multiply-accumulate with two literal pool loads (table-base
addresses), bit-fields used as array indices, etc. Each pick would
need 20-40 min of struct/symbol reconstruction.

These are **scaffolder-territory** rather than mechanical drain.
Surfaced as brief 229+ candidate.

## Why C-39b strict was skipped this wave

C-39b-solo (297 picks) has high shape diversity. Strict-clone scans:

- Exact byte-clones of brief 226's `021f8490` canonical: **0**
- Exact byte-clones of brief 226's `02206454` cross-call compare: not scanned
- Shape α (2-helper pipeline): **2** picks

Most C-39b picks are non-uniform allocator/dispatcher/early-return
shapes that need individual research. Deferred to brief 230+.

## What's deferred

Brief 230+ targets (in priority order):

1. **C-39b shape clusters** — mining the 297-pick cohort with
   per-shape recipes:
   - Early-return-on-bool prefix
   - Allocator + Fill32 family
   - Double-helper compare (rsb + bl + bl + cmp)
   - 3-helper chain
2. **C-39a uniform sub-cohort** — the `func_021b99b4 + mla` clones
   (02228a9c, 0222d5d8 are byte-identical pair — and more may exist).
   Needs symbol+struct reconstruction.
3. **Interleaved 2-bitfield extract** (V6 deferred from this wave) —
   `lsl r1, r0, #26; lsl r2, r0, #31; lsr r0; lsr r1` scheduling.
   Brief 224 documented as second-order divergence; may need
   per-pick variant work.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **6.4% → 6.8%** (547/8351) |

## Cross-references

- `docs/research/brief-222-c39-non-leaf-bitfield.md` — base recipe
- `docs/research/brief-224-c39-wave1.md` — wave 1 (1 .c of 25, identified second-order shapes)
- `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md` — sub-shape definitions
- `docs/research/brief-227-c38-chained-cast-c39-wave2.md` — wave 2 (19/19 bool-from-helper)
- `src/overlay002/func_ov002_02292b88.c` — wave 3 canonical V0 example
- `src/overlay002/func_ov002_022022f0.c` — wave 3 canonical V2 example
- `src/overlay002/func_ov002_02291214.c` — wave 3 canonical Shape α example
