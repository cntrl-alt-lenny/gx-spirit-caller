/* CAMPAIGN-PREP candidate for func_0203eca4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order s0,s1,sum; sum accumulates cb+(ca+(c8+c9)); c0-guard before sum-guard
 *   risk:       orig evaluates sum BEFORE testing base->f_c0 (cmp r0,#0 on c0 sits between the ldrb sum loads); if mwcc sinks the sum past the c0 branch the ldrb order diverges. reshape-able (statement order).
 *   confidence: med
 */
/* func_0203eca4 (C, 136B): sum-of-fields guard, two ed80 calls into stack, func_0206ea90(&a,&b).
 * self->b_d0d -> func_0203c814 index -> base = self + (idx<<8). Guard on base[0xc0],
 * then sum = c8+c9+ca+cb (accumulated cb+(ca+(c8+c9))), guard sum==0, then two ed80 + ea90.
 */
extern unsigned int func_0203c814(unsigned int x);
extern unsigned int func_0203ed80(unsigned char *p);
extern void func_0206ea90(unsigned int *a, unsigned int *b);

struct Self0203eca4 {
    unsigned char pad_c0[0xc0];        /* base reached via self + (idx<<8) */
    unsigned char f_c0;                /* +0xc0 */
    unsigned char pad_c1[7];
    unsigned char f_c8;                /* +0xc8 */
    unsigned char f_c9;                /* +0xc9 */
    unsigned char f_ca;                /* +0xca */
    unsigned char f_cb;                /* +0xcb */
};

struct Hdr0203eca4 {
    unsigned char pad[0xd0d];
    unsigned char b_d0d;               /* +0xd0d */
};

void func_0203eca4(struct Hdr0203eca4 *self) {
    struct Self0203eca4 *base;
    unsigned int s0;
    unsigned int s1;
    unsigned int sum;
    if (self->b_d0d >= 6) return;
    base = (struct Self0203eca4 *)((unsigned char *)self + (func_0203c814(self->b_d0d) << 8));
    sum = base->f_cb + (base->f_ca + (base->f_c8 + base->f_c9));
    if (base->f_c0 != 0) return;
    if (sum == 0) return;
    s0 = func_0203ed80(&base->f_c8);
    s1 = func_0203ed80((unsigned char *)&base->f_c8 + 4);
    func_0206ea90(&s0, &s1);
}
