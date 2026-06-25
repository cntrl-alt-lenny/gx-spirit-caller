/* CAMPAIGN-PREP candidate for func_022297e0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-iter b0 reload + i*0x14 induction; cf16c/0x868 bound consts; (u16)accum store
 *   risk:       loop reg-alloc/strength-reduction: orig keeps r5=cf16c,r4=0x868,r7=i,r8=accum,r9=i*0x14 across 5 iters. mwcc's coloring/SR of these is a coin-flip. permuter-class. +0x38 field struct-guessed.
 *   confidence: low
 */
/* func_ov002_022297e0: 0223df38 (stack out), byte-pair unpack r6(lo)/fp(hi),
 * 0225764c guard, then a 5-iter loop (i=0..4) over per-row u16 at
 * cf16c+(b0&1)*0x868 + i*0x14 + 0x38; if set, accum += 021c84c4(b0,i). Finally
 * 021d59cc(lo,hi,f0,2,(u16)accum). Orig binds cf16c(r5)+0x868(r4) as constants
 * and RELOADS b0 each iter (mla per-iter), with i*0x14 as an induction var (r9).
 * Loop body reads self->b0 inside the loop to match the per-iter ldrh+mla. */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_0223df38(struct S *self, int a, void *out);
extern int  func_ov002_0225764c(struct S *self, int lo, int hi);
extern int  func_ov002_021c84c4(int player, int i);
extern int  func_ov002_021d59cc(int lo, int hi, int f0, int k, u16 z);

int func_ov002_022297e0(struct S *self) {
    int out;
    int lo;
    int hi;
    int accum;
    int i;
    if (func_ov002_0223df38(self, 0, &out) == 0) return 0;
    lo = out & 0xff;
    hi = ((u16)out >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0) return 0;
    accum = 0;
    for (i = 0; i <= 4; i++) {
        if (*(u16 *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + i * 0x14 + 0x38) != 0)
            accum += func_ov002_021c84c4(self->b0, i);
    }
    func_ov002_021d59cc(lo, hi, self->f0, 2, (u16)accum);
    return 0;
}
