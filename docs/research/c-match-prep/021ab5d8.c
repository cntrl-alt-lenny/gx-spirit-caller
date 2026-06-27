/* CAMPAIGN-PREP candidate for func_021ab5d8 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual :7 OR-in pack + set bit14; store-order field0,field1,flag
 *   risk:       permuter-class: ov000_core.h names 021ab5d8 a ship-as-.s wall — multi-field bic/and/orr INSERT ORDER won't flip from C; also mul+[base,r3] reg-offset addr vs mla array-index. Likely escapes to .s.
 *   confidence: low
 */
/* func_ov000_021ab5d8 (ov000, D) — stride-44 row [r0], word at +0.
 * DUAL 7-bit field pack (header names this an explicit ship-as-.s wall).
 *   field0 :7 @ bit0  := arg1 | (old field0)
 *   field1 :7 @ bit7  := arg2 | (old field1)
 *   then set bit14 (0x4000).
 * Each new value is OR-ed with the existing field (the lr<<25>>25 / lr<<18>>25
 * reads), masked to 8 then re-masked to 7 on insert. Store order: field0 first,
 * then field1, then |0x4000. Addressing in orig is mul r3,#0x2c + [base,r3]
 * (base pooled separately) — NOT mla array indexing. */
struct Ov000Row { unsigned f0 : 7; unsigned f7 : 7; unsigned f14 : 1; unsigned : 17; char pad4[40]; };  /* stride 44 */
extern struct Ov000Row data_ov000_021c7530[];

void func_ov000_021ab5d8(int idx, int arg1, int arg2) {
    struct Ov000Row *p = &data_ov000_021c7530[idx];
    p->f0 = arg1 | p->f0;
    p->f7 = arg2 | p->f7;
    p->f14 = 1;
}
