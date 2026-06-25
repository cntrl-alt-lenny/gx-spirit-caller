/* CAMPAIGN-PREP candidate for func_021ab6ec (ov000, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind base to one ptr; field-pack RMW in asm bic/orr order; asr arg = signed >>1
 *   risk:       multi-field bic/orr INSERT ORDER on one word is the known ov000 stride-pack wall (ov000_core.h): mwcc may reorder the bic;orr;bic;bic;orr chain. permuter-class (or ship-as-.s like siblings 021ab798/af720).
 *   confidence: low
 */
/* func_ov000_021ab6ec — pack sub-fields of word[0] at data_ov000_021c7588,
 * call func_020b3870((arg1>>1)+0xff), fold its low byte into bits[19:12],
 * then tail-call func_ov000_021ab8f8. Base held in one reg across all uses
 * (bind to one struct ptr). Store order: word stored once before the call,
 * then re-loaded/re-stored after.
 *   bits[7:0]=0xff; bits[9:8] cleared; bits[11:10]=arg0&3; bits[19:12]=ret&0xff */

extern unsigned int data_ov000_021c7588[];
extern int func_020b3870(int);
extern void func_ov000_021ab8f8(void);

void func_ov000_021ab6ec(int a0, int a1) {
    int r = (a1 >> 1) + 0xff;
    data_ov000_021c7588[0] = (((data_ov000_021c7588[0] & ~0xffu) | 0xff)
                              & ~0x300u & ~0xc00u)
                             | (((unsigned)(a0 << 30) >> 20));
    r = func_020b3870(r);
    data_ov000_021c7588[0] = (data_ov000_021c7588[0] & ~0xff000u)
                             | (((unsigned)(r << 24) >> 12));
}
