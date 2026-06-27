/* CAMPAIGN-PREP candidate for func_021ab688 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual :5 overwrite insert at bit16/bit21 + set bit15; store-order
 *   risk:       permuter-class: same stride-44 PACK family as the named 021ab5d8/62c walls — two-field bic/orr insert order + mul+[base,ip] reg-offset addressing (vs mla array-index) is the documented un-flippable divergence. Try but expect .s.
 *   confidence: low
 */
/* func_ov000_021ab688 (ov000, D) — stride-44 row [r0], word at +0.
 * DUAL 5-bit field insert (no read-back of old field value — pure overwrite):
 *   field0 :5 @ bit16 (mask 0x1f0000) := arg1
 *   field1 :5 @ bit21 (mask 0x3e00000) := arg2
 *   then set bit15 (0x8000).
 * Orig masks arg to 8 (and #0xff) then <<27>>11 / <<27>>6 to land 5 bits.
 * Store order: field0, field1, |0x8000. mul + [base,ip] register-offset. */
struct Ov000Row { unsigned : 15; unsigned f15 : 1; unsigned f16 : 5; unsigned f21 : 5; unsigned : 6; char pad4[40]; };  /* stride 44 */
extern struct Ov000Row data_ov000_021c7530[];

void func_ov000_021ab688(int idx, int arg1, int arg2) {
    struct Ov000Row *p = &data_ov000_021c7530[idx];
    p->f16 = arg1;
    p->f21 = arg2;
    p->f15 = 1;
}
