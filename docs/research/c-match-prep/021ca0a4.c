/* CAMPAIGN-PREP candidate for func_021ca0a4 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     <<12/<<16/<<9 scales, stack-slot store-order preserved, block-by-ptr arg
 *   risk:       permuter-class + struct-guessed: exact 8-slot stack frame ordering and which incoming stack args map to s_38/s_3c is inferred from sp offsets; mwcc's outgoing-arg store scheduling rarely matches first build. The <<16>>16 must stay zero-ext (lsr) not sign.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov004_021ca0a4 (ov004, class D) — brief 494.
 * UNVERIFIED build-free draft. stack-arg marshalling, lsl scales, store-order.
 * scales: a2<<12, a3<<12 -> slots[0..1] of a 2-word block at sp+0x20 (passed by
 *  ptr to func_0201e964); a@0x3c <<16>>16 (zero-ext low16) -> func_0201e800.
 * call1: func_0201e800(self->f10, (u16)stackA);
 * then build 8-word stack frame (sp+0..0x1c) in store-order: 0,0, stackB,
 *  stackB, self->f4, self->f0<<9, 0, 0; r2 = sp+0x20; r1 = self->f10->f2c.
 * call2: func_0201e964(a1, self->f10->f2c, sp+0x20-block, <stacked args>).
 * recipe: <<12/<<16/<<9 scales kept, store-order of stack slots preserved.
 */
extern int func_0201e800(int a, int b);
extern int func_0201e964(int a, int b, void *blk, int s0, int s1, int s2,
                         int s3, int s4, int s5, int s6, int s7);

struct St0a4 { int f0; int f4; char _8[8]; int *f10; };  /* f10 -> sub, sub.f2c */
struct Sub0a4 { char _0[0x2c]; int f2c; };

int func_ov004_021ca0a4(struct St0a4 *self, int a1, int a2, int a3,
                        int s_38, int s_3c) {
    int blk[2];
    struct Sub0a4 *sub = (struct Sub0a4 *)self->f10;
    blk[0] = a2 << 12;
    blk[1] = a3 << 12;
    func_0201e800((int)self->f10, (unsigned short)s_3c);
    func_0201e964(a1, sub->f2c, blk,
                  0, 0, s_38, s_38,
                  self->f4, self->f0 << 9, 0, 0);
    return 0;
}
