/* CAMPAIGN-PREP candidate for func_022123fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     DECL-ORDER: i+out before mask (puts i in r5/mask r6 like orig); (u16)out>>8 3-shift; orr-shift accumulator; predicated if
 *   risk:       Compile-verified BYTE-IDENTICAL. Decl-order (i,out before mask) was the lever for the r5/r6 split; (u16)>>8 gave the 3-shift form. No expected divergence.
 *   confidence: high
 */
typedef unsigned short u16;
extern int  func_ov002_0223df38(void *self, int i, int *out);
extern int  func_ov002_0225764c(void *self, int a, int b);
extern int  func_ov002_021de408(void *self, int mask);
int func_ov002_022123fc(void *self) {
    int i;
    int out;
    int mask = 0;
    for (i = 0; i < 2; i++) {
        if (func_ov002_0223df38(self, i, &out) != 0) {
            int lo = out & 0xff;
            int hi = ((u16)out >> 8) & 0xff;
            if (func_ov002_0225764c(self, lo, hi) != 0)
                mask |= 1 << (hi + (lo << 4));
        }
    }
    func_ov002_021de408(self, mask);
    return 0;
}
