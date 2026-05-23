# Code-decomp wave 3 (brief 193) — medium-easy walls report

**Brief:** 193 (decomper). Wave 3 of the code-decomp resumption (brief
187 queue's medium-easy bucket, 15 picks at size 0x60..0x100). This
note documents the wall clusters that surfaced during the attempt
and flags follow-ups for brief 195+.

## Summary

**Picks shipped: 0 of 15** (below the brief's ≥8 target). Every
attempt diverged on byte-identity after a single iteration, mostly
due to two new wall clusters surfacing that brief 189's predictor
doesn't catch:

- **Cluster E — mwcc register-allocation + scheduling drift.** The
  medium-easy size range exposes mwcc 2.0's register-allocator
  decisions in ways the trivial/easy buckets didn't. Multiple
  picks compile to byte-different output where the C is logically
  correct.
- **Cluster F — ov004 cascade triggered by main-module `.legacy.c`.**
  Adding a new `.legacy.c` file in `src/main/` (which routes through
  mwcc 1.2/sp2p3) triggered `_dsd_gap@ov004_41.o (.text)` shifts
  of +32 to +64 bytes — well past `MAX_SHIFT_BYTES = 4`. Brief 190
  successfully shipped 4 main `.legacy.c` files (all StyleA SNDi
  wrappers at 0x28-0x34 bytes); brief 193's larger candidates
  (0x68-0x9c bytes) trigger the cascade. Suspected mechanism:
  mwcc 1.2's larger `.text` output for these picks reorders the
  link layout, mwldarm emits or relocates an interwork veneer
  that ov004 expects at a stable VA. Needs scaffolder investigation.

## Per-pick attempts + diagnosis

### Cluster A repeats — cross-module hardcoded BLs (not encountered)

None of brief 193's 15 picks hit Cluster A (the brief 190 cross-
overlay hardcoded-BL wall). All 15 picks are in main or itcm, with
resolved relocs for every external call.

### Cluster E (NEW) — mwcc register-allocation drift

**Picks affected: #2, #7, #12, #15 (all attempted).**

The classic case is brief 193 pick #7 (`func_02023f7c`):

```c
state_t *p = &data_0219a8e4;
Fill32(0, p, 8);
p->saved_arg = arg0;
if (p->handle == 0) {
    int size = p->saved_arg * 0x88;
    p->handle = Task_PostLocked(size, 4, 0);
    Fill32(0, p->handle, size);
}
return 1;
```

- **Orig**: loads the data pointer into `r4` (callee-saved), uses
  `r4` across the call chain, with the second reference to
  `data_0219a8e4` literal-pooled separately.
- **mwcc 2.0/sp1p5 build**: loads into `r1` (caller-saved) for the
  Fill32 call, then reloads from a SINGLE pool entry — CSE'd the
  two `&data_0219a8e4` expressions into one literal.

The function still produces correct byte content per-instruction
(individual instructions match opcodes), but the **register choice
and scheduling differ**, so the function fails the SHA1 byte check
even though logical semantics are identical.

Same shape on #12 (`func_02024574` find-first):

- Orig: `ldr r5, [r1, #4]` then `ldr r1, [pc, #0x58]` (re-load
  literal into r1).
- Built: `ldr r2, [r1, #4]` then `mov r3, #0` — mwcc chose r2 vs
  orig's r5 for count, and reordered the literal reload after the
  init store.

This is the same diagnosis brief 190 surfaced as "Cluster B —
mwcc 2.0 elides what orig emits" but the medium-easy bucket
shows it more frequently. **Permuter is the natural target** for
these picks (mwcc has multiple correct codegens; permuter searches
the source-shape space). Brief 195+ should batch these into a
permuter wave.

### Cluster F (NEW) — `.legacy.c` triggers ov004 cascade

**Picks affected: #2, #5, #7 (all attempted as `.legacy.c`).**

Adding a `.legacy.c` to `src/main/` for any of the brief 193
medium-easy picks reproduces:

```
error: build/eur/build/arm9_ov004.bin: TU _dsd_gap@ov004_41.o (.text)
       has shift +32 to +64 bytes
       (|shift| > MAX_SHIFT_BYTES = 4); structural regression suspected
       — bail rather than relocate a TU section whose layout cause
       we have not characterised.
```

The brief 180/183/186 patcher flags this as a structural regression
and bails. Brief 190's 4 main `.legacy.c` picks (size 0x28–0x34) did
NOT trigger this; brief 193's larger candidates (0x68+) do.

**Hypothesis** (untested): mwcc 1.2/sp2p3 emits more bytes per
function than mwcc 2.0/sp1p5 for the same C. Past a certain
cumulative-main-module-size delta, mwldarm relocates an interwork
veneer that ov004 expects at a stable VA — the +32 / +64 shift
matches roughly one veneer pair (8 bytes each).

**Scaffolder follow-up:** instrument the patcher to dump which
veneer moved and by how much when this triggers, then either
(a) extend `_layout_reconstruct`'s MAX_SHIFT_BYTES for `_dsd_gap`
TUs that are linker-veneer-only, or (b) add a pre-link size budget
that warns when main's `.text` cumulative size approaches a
veneer-shifting threshold.

Until that lands, **`.legacy.c` files larger than ~0x50 bytes in
`src/main/` should be considered blocked.**

### Style A predictions hold for `.s` outputs

All 3 of brief 193's predicted StyleA picks (#5, #9 — both
attempted; #10 not attempted) hit either Cluster E or Cluster F.
Style A's `.legacy.c` routing is no longer a sufficient recipe at
medium-easy size; the StyleA + something-else combination needs
case-by-case analysis.

### Hardware-register fold

Brief 193's #5 and #9 share the brief 190 #18 issue: mwcc folds
constant + offset into a single literal. Source-side workarounds
attempted:

- `(volatile u32 *)(BASE + OFFSET)` — folded
- Struct pointer cast: `((volatile hw_t *)BASE)->field_at_OFFSET` — folded
- Local pointer variable: `volatile u32 *base = ...; base[OFFSET/4]` — folded

mwcc 1.2's constant folding looks aggressive on these patterns.
The orig was likely built with a specific compiler option (or hand
asm) that bypasses the fold. Out of scope to investigate per-pick.

## Per-pick disposition

| # | Pick | Predicted walls | Attempted | Outcome | Cluster |
|---|---|---|---|---|---|
| 1 | `func_0207dbf8` (0x64) | none | no | bump-allocator with negative-offset field access, structural reading uncertain | (deferred) |
| 2 | `func_0200b2f4` (0x68) | C-15 | yes | both `.c` and `.legacy.c` cascade ov004 | F |
| 3 | `func_0203d078` (0x68) | C-1 | no | predicated chain too complex for first attempt | (deferred) |
| 4 | `func_0207db8c` (0x6c) | C-1 | no | top-down allocator with `[r5, #-4]` flags access | (deferred) |
| 5 | `func_02096434` (0x6c) | StyleA | yes | `.legacy.c` cascade + hardware-register fold | F + fold |
| 6 | `func_0200ed48` (0x70) | none | no | find-first slot, bitfield extract — structural reading needed | (deferred) |
| 7 | `func_02023f7c` (0x70) | none | yes | mwcc reg alloc differs | E |
| 8 | `func_02026fd8` (0x70) | none | no | clone of #7 (same shape, different constant + symbol) | E (by clone) |
| 9 | `func_02093dc8` (0x70) | StyleA | no | DMA programmer — would hit hardware-register fold | (skipped per #5 outcome) |
| 10 | `func_01ff86fc` (0x74) | StyleA, C-1 | no | itcm DMA programmer — same as #9 | (skipped) |
| 11 | `func_02021b38` (0x74) | C-15, C-1 | no | multiple extern data refs + -1 init loop | (deferred) |
| 12 | `func_02024574` (0x74) | none | yes | mwcc reg alloc differs | E |
| 13 | `func_020270d0` (0x74) | none | no | clone of #12 | E (by clone) |
| 14 | `func_02028790` (0x74) | none | no | clone of #12 | E (by clone) |
| 15 | `OSi_PostIrqEvent` (0x9c) | C-1 | no | 4 extern data tables + multiple predicated branches | (deferred) |

## What would unblock the bucket

1. **Permuter wave on the Cluster E picks (≈8 picks).** mwcc 2.0
   has multiple correct codegens; permuter searches them. Brief 195+
   should pick a top-3-likely-to-permute subset (#7, #8, #12, #13,
   #14 are the cleanest candidates) and run them through brief 098's
   wrapper.
2. **Scaffolder Cluster F investigation.** The `.legacy.c`-triggers-
   ov004-cascade pattern needs root-cause analysis. Once fixed,
   #2 / #5 / #9 / #10 / #11 become viable.
3. **Hardware-register fold workaround.** Picks #5, #9, #10, #18
   (brief 190) all share the `(BASE + offset)` fold. May need a
   per-pick `#pragma` or `volatile` discipline doc. Scaffolder
   research.

## Coming back to this bucket

Brief 195+ should NOT re-attempt these 15 picks under the same
recipes — same walls will re-trigger. Either:
- Permuter wave (Cluster E picks); or
- After scaffolder unlocks Cluster F (then re-attempt #2, #5, #9,
  #10, #11 with `.legacy.c`).

The brief 187 queue is functionally drained at the medium-easy
level until those unlocks land.

## See also

- [`docs/research/code-decomp-resumption-queue.md`](code-decomp-resumption-queue.md) — the curated 52-pick queue
- [`docs/research/code-decomp-wall-predictions.md`](code-decomp-wall-predictions.md) — brief 189's predictor
- [`docs/research/first-wave-wall-style-a.md`](first-wave-wall-style-a.md), [`first-wave-wall-c1.md`](first-wave-wall-c1.md), [`first-wave-wall-c15.md`](first-wave-wall-c15.md), [`first-wave-wall-mwldarm-interwork.md`](first-wave-wall-mwldarm-interwork.md) — known walls
- Brief 190 PR #637 — easy-bucket wave 1 with Cluster A/B/C/D walls
