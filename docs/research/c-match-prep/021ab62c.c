/* CAMPAIGN-PREP candidate for func_021ab62c (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual :7 (~arg & old) pack + set bit14; mvn precomputed before load
 *   risk:       permuter-class: header names 021ab62c a ship-as-.s wall (same family as 021ab5d8). Insert order + the two ~arg mvns hoisted before the field load (r4 callee-saved) won't reproduce from C; mul+[base,r3] addr too.
 *   confidence: low
 */
/* func_ov000_021ab62c (ov000, D) — stride-44 row [r0], word at +0.
 * DUAL 7-bit field pack, MVN twin of 021ab5d8 (header names both as ship-as-.s).
 *   field0 :7 @ bit0  := (~arg1) & (old field0)
 *   field1 :7 @ bit7  := (~arg2) & (old field2)
 *   then set bit14 (0x4000).
 * Orig pre-computes ip=~arg1, r4=~arg2 (held in callee-saved r4) BEFORE the
 * field load, then ANDs into the existing field bits. Store order: field0,
 * field1, |0x4000. Addressing = mul + [base,r3] register-offset (base pooled). */
struct Ov000Row { unsigned f0 : 7; unsigned f7 : 7; unsigned f14 : 1; unsigned : 17; char pad4[40]; };  /* stride 44 */
extern struct Ov000Row data_ov000_021c7530[];

void func_ov000_021ab62c(int idx, int arg1, int arg2) {
    struct Ov000Row *p = &data_ov000_021c7530[idx];
    p->f0 = ~arg1 & p->f0;
    p->f7 = ~arg2 & p->f7;
    p->f14 = 1;
}
