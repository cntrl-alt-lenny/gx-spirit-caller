# Brief 226 — C-39 sub-classification: sign-check + helper-reuse

**Status:** Both sub-shapes lock byte-identical. C-39a (sign-check) and
C-39b (helper-reuse) shipped as separate sub-classifications under
the existing C-39 wall. 3/3 picks per sub-shape ship.

**Provenance:** Brief 224 (PR #687) drained 25 SOLO C-39 picks under
the brief 222 base recipe but identified 4 second-order shape
variations blocking the remaining ~455 picks. Brief 226 took 2 of
those 4 variations:

  - **Sub-shape A — sign-check vs comparison**: orig had
    `movs r1, r0; bmi .end` after the helper bl; mwcc with the
    natural recipe emitted `cmp r0, #0; blt .end` (same byte
    count, different bytes).
  - **Sub-shape B — helper-return reuse**: orig stored the helper
    return in a callee-saved register and reused it. Brief 224
    already locked the canonical idiom for this (`021f4a00.c`);
    brief 226 verified the recipe generalises.

Brief 226 closes both sub-classifications as **recipe-shippable**.

## Recipe summary

### C-39a — sign-check via dead-arg helper-reuse

**Source:**
```c
int n = helper1(...);
if (n >= 0) {
    helper2(arg, n);     /* helper2's 2nd arg is n — forces live-in-r1 */
}
return X;
```

**Codegen produced (mwcc 2.0/sp1p5):**
```
bl    helper1
movs  r1, r0            ; r1 = n, set flags
bmi   .end              ; branch if N (n < 0)
... helper2 setup ...
bl    helper2           ; r1 still holds n
.end:
mov   r0, #X
pop   {r4, pc}
```

**Why it works:** declaring helper2 to take `n` as a second arg
forces mwcc to keep n live in r1 across the branch. The peephole
`mov r1, r0; cmp r1, #0; blt` → `movs r1, r0; bmi` then fires.
Without the dead-arg trick, mwcc emits `cmp r0, #0; blt` directly
(n dies in r0).

The condition MUST be a pure sign test (`n < 0` / `n >= 0`).
`n > 0` requires both Z and N flags and does NOT peephole — that
case lands in C-39b.

### C-39b — helper-return reuse

**Three idioms ship under this sub-shape:**

1. **Sign-check via `n > 0` + helper2 takes n** (canonical case,
   shape brief 224 locked):
   ```c
   int n = helper1(...);
   if (n > 0) {
       helper2(arg, n, 0, 0);
   }
   return 1;
   ```
   Emits `mov r1, r0; cmp r1, #0; ble .end; ...`.

2. **Cross-call comparison** — n preserved across a second helper
   call and compared with its return:
   ```c
   int n = helper1(args);
   return n >= helper2(self);
   ```
   Emits `mov r4, r0; ... bl helper2; cmp r4, r0; movge/movlt; pop`.
   n goes into r4 (callee-saved) because helper2 clobbers r0-r3.

3. **No sign-check** — n stored across bitfield extracts and
   passed to helper2 as 2nd arg:
   ```c
   int n = helper1(self);
   helper2(self->f2.bit_a ^ self->f2.bit_b, n);
   return 1;
   ```
   Emits `mov r1, r0` after first bl, then bitfield setup, then
   bl helper2 with r1 still holding n.

## Variant matrix (sub-shape A)

Tested 10 candidate idioms against `func_ov002_021f4cd4` (A1) under
default mwcc 2.0/sp1p5. Only v10b reached byte-identical:

| Variant | Source idiom | Result | Why |
|---|---|---|---|
| v1 | `int n = helper(...); if (n >= 0) helper2(bit0)` | `cmp r0, #0; blt` | n dies in r0; no reason to copy |
| v2 | `if ((n & 0x80000000) == 0) helper2(bit0)` | `tst r0, #0x80000000; bne` | explicit mask → tst |
| v3 | `signed char n = (signed char)helper(...); if (n >= 0)` | `lsl/asrs; bmi` | adds sign-extend |
| v4 | `int n = helper(...); volatile int sink = n; if (sink >= 0)` | `cmp r0, #0; blt` | volatile reads back from stack |
| v5 | `register int n = helper(...); if (n >= 0)` | `cmp r0, #0; blt` | register hint ignored (n still in r0) |
| v6 | `if (n < 0) return 1; helper2(bit0);` | `cmp r0, #0; bmi` | early-return polarity, same shape |
| v7 | `if ((n = helper(...)) < 0) return 1; helper2(bit0);` | `cmp r0, #0; bmi` | comma operator, same |
| v8 | `if (-n > 0) return 1; helper2(bit0);` | `cmp r0, #0` | negation folded away |
| v9 | `if (n < 0) return 1; helper2(bit0, n);` | `movs r1, r0; movmi r0, #1; popmi {...}` | conditional-execution collapse |
| **v10b** | `if (n >= 0) helper2(bit0, n);` (if-then form) | **`movs r1, r0; bmi`** ✓ | **byte-identical** |

**Insight:** the recipe requires BOTH (i) helper2 to declare `n` as a
later arg, AND (ii) the control flow to be `if (n >= 0) { ... }
return X;` (NOT early-return `if (n < 0) return X; ...`). With
early-return, mwcc collapses to conditional execution (`movmi r0,
#X; popmi`) instead of `bmi` branch.

## Variant matrix (sub-shape B)

Sub-shape B was already locked in brief 224 (`func_ov002_021f4a00.c`);
brief 226 verified generalisation across 3 picks with different
post-helper patterns:

| Pick | Idiom | Result | Notes |
|---|---|---|---|
| `021f8490` (56 B) | `if (n > 0) helper2(bit, n, 0, 0)` | ✓ | Brief 224 recipe shape, no preceding tag-check |
| `02206454` (60 B) | `return n >= helper2(self)` | ✓ | Cross-call compare; n in r4 (callee-saved) |
| `021f49d0` (48 B) | `helper2(bit_a ^ bit_b, n)` | ✓ | No sign-check; XOR operand order matters (`bit0 ^ bit14` matches; `bit14 ^ bit0` reorders extracts) |

## Detector signatures (`tools/predict_walls.py`)

Both sub-shapes are emitted ADDITIONALLY to the base C-39 wall
(they don't suppress C-39). The detector preserves the existing
C-39 fire and adds sub-shape hints:

- **C-39a** fires when `movs rD, r0` (`e1b0_D000`, D = 1..f) appears
  AFTER the first `bl`, followed within 1-2 instructions by `bmi`
  (`4a__`).

- **C-39b** fires when `mov rD, r0` (`e1a0_D000`, D = 1..4) appears
  AFTER the first `bl`. The D restriction (1..4) keeps false-positive
  rate low; broader matches would over-fire on generic reg-to-reg
  copies unrelated to helper-reuse.

5 unit tests added in `tests/test_predict_walls.py::TestC39SubShapeDetection`:

1. `test_a1_canonical_sign_check_fires_c39a` — A1 disasm fires
   C-39 + C-39a (not C-39b).
2. `test_b1_helper_reuse_fires_c39b` — B1 disasm fires C-39 +
   C-39b (not C-39a).
3. `test_b3_fires_both_c39_and_c39b` — B3 (helper-reuse without
   sign-check) fires C-39 + C-39b.
4. `test_c39_without_sub_shape_signal` — baseline C-39 pick
   (brief 222 canonical) fires C-39 only, no sub-shape.
5. `test_movs_to_r0_does_not_fire_c39a` — degenerate
   `movs r0, r0` self-flag-set does NOT match C-39a (Rd must
   be non-zero).

## Shipped worked examples (6 picks)

All under `src/overlay002/`. C-39a picks (sub-shape A):

- `func_ov002_021f4cd4.c` — 68 B, canonical sign-check
- `func_ov002_021f84ec.c` — 68 B, same shape, different helper2
- `func_ov002_022237a0.c` — 80 B, `1-bit0` (rsb) + u32 field + return 0

C-39b picks (sub-shape B):

- `func_ov002_021f8490.c` — 56 B, `if (n > 0)` form
- `func_ov002_02206454.c` — 60 B, cross-call compare
- `func_ov002_021f49d0.c` — 48 B, no sign-check (helper-reuse only)

## What's next

The remaining 2 of brief 224's 4 second-order shape variations:

- **Bitfield packing into helper args** — orig pre-packs bit-fields
  into a single u32 via or/shift before calling helper; mwcc with
  natural per-arg passing emits separate bitfield extracts. Sub-
  shape candidate for a future brief.

- **Multi-call sequences (no CSE on volatile fields)** — orig
  re-reads bitfields between each helper call; mwcc CSEs the
  reads. Defer to scheduling-wall research.

If brain wants to extend further, brief 228 could take the
bitfield-packing sub-shape. The multi-call no-CSE variant looks
like a scheduling wall (not source-side), so probably P-class
territory.

## Estimated drain unlock

Brief 224 baseline: 480 SOLO C-39 picks identified; 25 shipped
under base recipe (5.2% drain rate). Of the remaining 455:

- Estimated ~40% match sub-shape A (sign-check) signature → ~180 picks
  newly recipe-shippable.
- Estimated ~30% match sub-shape B (helper-reuse) signature → ~135
  picks newly recipe-shippable.
- The two sub-shapes overlap (a pick can be both helper-reuse AND
  sign-check); decomper needs to read the predictor cue to pick
  the right idiom.

Total decomper drain target for brief 228+: **~250-300 additional
C-39 picks** shippable under sub-shape recipes. At ~10 min/pick
that's ~40-50 hours of mechanical drain work — but the recipe is
locked, so the rate should match brief 224's effective throughput.
