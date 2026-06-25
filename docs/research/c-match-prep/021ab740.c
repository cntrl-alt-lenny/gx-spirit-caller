/* CAMPAIGN-PREP candidate for func_021ab740 (ov000, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: as 021ab6ec plus orr 0x100 for bits[9:8]=01; bic/orr in asm order
 *   risk:       same multi-field insert-order wall as 021ab6ec, plus the extra orr 0x100 must land between bic 0x300 and bic 0xc00; mwcc constant-merge may reorder. permuter-class / ship-as-.s sibling.
 *   confidence: low
 */
/* func_ov000_021ab740 — sibling of 021ab6ec; identical except bits[9:8]=01
 * (bic 0x300 then orr 0x100). Same base-bind, same store order, same call
 * sequence func_020b3870((arg1>>1)+0xff) then tail func_ov000_021ab8f8. */

extern unsigned int data_ov000_021c7588[];
extern int func_020b3870(int);
extern void func_ov000_021ab8f8(void);

void func_ov000_021ab740(int a0, int a1) {
    int r = (a1 >> 1) + 0xff;
    data_ov000_021c7588[0] = ((((data_ov000_021c7588[0] & ~0xffu) | 0xff)
                               & ~0x300u) | 0x100u)
                             & ~0xc00u
                             | (((unsigned)(a0 << 30) >> 20));
    r = func_020b3870(r);
    data_ov000_021c7588[0] = (data_ov000_021c7588[0] & ~0xff000u)
                             | (((unsigned)(r << 24) >> 12));
}
