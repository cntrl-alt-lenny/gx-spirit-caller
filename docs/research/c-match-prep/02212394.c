/* CAMPAIGN-PREP candidate for func_02212394 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload self->f2.bit0 (not bound); (bit0&1) adds the and + steers result reg to ip; bmi guard; +0x418 base + r*4
 *   risk:       Compile-verified BYTE-IDENTICAL. The (bit0&1) on the index (vs plain bitfield) was load-bearing: it both adds orig's `and r2,#1` and flips the c2e34 result into ip. No expected divergence.
 *   confidence: high
 */
typedef unsigned short u16;
struct F02212394_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02212394_Self { u16 f0; struct F02212394_F2 f2; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_021c2e34(int a, int b);
extern int  func_ov002_021d7d0c(void *self, int b, int *p);
int func_ov002_02212394(struct F02212394_Self *self) {
    int r = func_ov002_021c2e34(self->f2.bit0, 0x12e5);
    if (r >= 0) {
        int *p = (int *)(data_ov002_022cf16c +
                         (self->f2.bit0 & 1) * 0x868 + 0x418);
        func_ov002_021d7d0c(self, self->f2.bit0, &p[r]);
    }
    return 0;
}
