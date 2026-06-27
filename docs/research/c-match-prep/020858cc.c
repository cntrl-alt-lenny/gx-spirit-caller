/* CAMPAIGN-PREP candidate for func_020858cc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: hold sx/sy/out/in in regs; rsb negate; mul then asr#c fixed-point
 *   risk:       permuter-class: sx(<<12)/sy(<<12) and out/in must stay in r4/r7/r6/r5 across 4 calls, and the s16 reloads (`ldrsh` re-read per use, not cached) must match; a reg-alloc/CSE coin-flip here likely needs permuter.
 *   confidence: low
 */
/* func_020858cc: builds a fixed-point transform block (out, +0x4,+0x10,+0x14,
 * +0x30,+0x34) from sprite params (in: u16 +0x2c,+0x2e scale; s16 +0x20,+0x22
 * angles). func_0208be38(y,x) kicks the HW divider; func_0208bed8() reads the
 * quotient. r6=out, r5=in, r4=x(<<12), r7=y(<<12) held callee-saved. */

extern void func_0208be38(int a0, int a1);
extern int  func_0208bed8(void);

void func_020858cc(int *out, unsigned char *in)
{
    int sx = *(unsigned short *)(in + 0x2c) << 0xc;
    int sy = *(unsigned short *)(in + 0x2e) << 0xc;
    int r;

    func_0208be38(sy, sx);
    out[0]   = *(short *)(in + 0x22);
    out[0x5] = *(short *)(in + 0x22);          /* +0x14 */
    r = func_0208bed8();
    out[0x1] = (-(int)*(short *)(in + 0x20) * r) >> 0xc;

    func_0208be38(sx, sy);
    out[0xc] = (*(unsigned short *)(in + 0x2c) *
                (-(*(short *)(in + 0x20) + *(short *)(in + 0x22)) + 0x1000))
               << 0x3;                         /* +0x30 */
    out[0xd] = (*(unsigned short *)(in + 0x2e) *
                ((*(short *)(in + 0x20) - *(short *)(in + 0x22)) + 0x1000))
               << 0x3;                         /* +0x34 */
    r = func_0208bed8();
    out[0x4] = (*(short *)(in + 0x20) * r) >> 0xc; /* +0x10 */
}
