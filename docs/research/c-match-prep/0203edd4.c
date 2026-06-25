/* CAMPAIGN-PREP candidate for func_0203edd4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order f4,f8 then fc/f10..f20 in asm order; bind base; memcpy(template,dst,0x58)
 *   risk:       arg regs: orig keeps src in r6 / self in r5 / dst in r4 (mov r6,r0;mov r4,r2;mov r5,r1) -- a callee-saved permutation. If mwcc assigns r4<-r0(src) instead, the three mov + every later use renumber. permuter-class.
 *   confidence: med
 */
/* func_0203edd4 (C, 192B): memcpy template into dst, two src copies, then per-field stores.
 * r6=src(arg0), r5=self(arg1), r4=dst(arg2). func_02094688(template,dst,0x58) = memcpy.
 * Then dst+4=src[0], dst+8=src[4]. Guard self->b_d0d; base=self+(idx<<8); on base[0xc0].
 */
extern char data_020bec8c[];
extern unsigned int func_0203c814(unsigned int x);
extern unsigned int func_0203ed2c(unsigned int x);
extern unsigned int func_0203ed80(unsigned char *p);
extern void *func_02094688(void *dst, void *src, int n);   /* note: asm passes (template, dst, 0x58) */

struct Src0203edd4 { unsigned int w0; unsigned int w4; };

struct Dst0203edd4 {
    unsigned int f0;
    unsigned int f4;     /* = src->w0 */
    unsigned int f8;     /* = src->w4 */
    unsigned int fc;     /* flag */
    unsigned int f10;
    unsigned int f14;
    unsigned int f18;
    unsigned int f1c;
    unsigned int f20;
};

struct Hdr0203edd4 {
    unsigned char pad_c0[0xc0];
    unsigned char f_c0;
    unsigned char pad_c1[0xf];
    unsigned char f_d0;          /* +0xd0 */
    unsigned char pad_d1[0xd0d - 0xd1];
    unsigned char b_d0d;
};

void func_0203edd4(struct Src0203edd4 *src, struct Hdr0203edd4 *self, struct Dst0203edd4 *dst) {
    struct Hdr0203edd4 *base;
    func_02094688(data_020bec8c, dst, 0x58);
    dst->f4 = src->w0;
    dst->f8 = src->w4;
    if (self->b_d0d >= 6) return;
    base = (struct Hdr0203edd4 *)((unsigned char *)self + (func_0203c814(self->b_d0d) << 8));
    if (base->f_c0 == 0) {
        dst->fc = 1;
        dst->f10 = 0;
        dst->f14 = 0;
        dst->f18 = 0;
        dst->f1c = 0;
        dst->f20 = 0;
        return;
    }
    dst->fc = 0;
    dst->f10 = func_0203ed80((unsigned char *)base + 0xc0);
    dst->f14 = func_0203ed2c(base->f_d0);
    dst->f18 = func_0203ed80((unsigned char *)base + 0xc4);
    dst->f1c = func_0203ed80((unsigned char *)base + 0xc8);
    dst->f20 = func_0203ed80((unsigned char *)base + 0xcc);
}
