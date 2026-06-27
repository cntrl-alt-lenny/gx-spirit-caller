/* CAMPAIGN-PREP candidate for func_0221074c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: eor of two :1 extracts -> parity; rsb #1 for 1-bit complement
 *   risk:       call-result lifetime: orig keeps 02210264's result in r1 across the ldrh/cmp guard then tests it last; mwcc may spill/reload r1 -> reshape-able (mov r1,r0 binds it). Guard cmp/cmpne chain (k==A || k==A+0x9c) order must match.
 *   confidence: med
 */
/* func_ov002_0221074c (ov002, cls D): compute parity r5 = (off2:6 bit5)^(off2 bit0)
 * [eor of two :1 extracts], call 02210264(), then if *(self) is in {0x19c7, 0x19c7+0x9c}
 * recompute r5 = 1 - (off2 bit0); finally if the 02210264 result r0>0, call
 * 021e104c(r5). self=r0->r4. LIT0=0x19c7. */
extern int  func_ov002_021e104c(int a);
extern int  func_ov002_02210264(void);
int func_ov002_0221074c(unsigned short *self) {
    unsigned short h = self[1];          /* off2 */
    int r5 = ((h << 0x11) >> 0x1f) ^ ((h << 0x1f) >> 0x1f);
    int r1 = func_ov002_02210264();
    unsigned short k = self[0];
    if (k == 0x19c7 || k == 0x19c7 + 0x9c) {
        r5 = 1 - ((self[1] << 0x1f) >> 0x1f);
    }
    if (r1 > 0)
        func_ov002_021e104c(r5);
    return 0;
}
