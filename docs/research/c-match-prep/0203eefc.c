/* CAMPAIGN-PREP candidate for func_0203eefc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order a(r4),h(r5); movs sets h then beq; if-equal guards f10 store; index self+0x444+(b<<2)
 *   risk:       orig holds h in r5 via 'movs r5,r0' (sets Z for the ==0 test in one op) and a in r4. If mwcc reorders the two calls (c900 vs 4320c) or splits the movs into mov+cmp, register pair and the flag-reuse diverge. reshape-able (decl/call order).
 *   confidence: med
 */
/* func_0203eefc (C, 108B): guard chain returning status codes.
 * r6=self(arg0). a=func_0203c900(1); h=func_0204320c(); if(h==0) return 0xe.
 * Compare self->b_d0d via func_0203c814 against a->f15; if equal, a->f10=func_020431f4().
 * func_020432d0(); if(h==0xb) return 0xf. Else set self at +0x444+(b_d13<<2)=1, return 0xb.
 */
extern void *func_0203c900(int x);
extern unsigned int func_0203c814(unsigned int x);
extern unsigned int func_020431f4(void);
extern void *func_0204320c(void);
extern void func_020432d0(void);

struct A0203eefc {
    unsigned char pad10[0x10];
    unsigned int f10;            /* +0x10 */
    unsigned char pad14;
    unsigned char f15;           /* +0x15 */
};

struct Hdr0203eefc {
    unsigned char pad[0x444];    /* flag array base at +0x444, indexed by b_d13<<2 */
    unsigned char flags[1];
};

int func_0203eefc(unsigned char *self) {
    struct A0203eefc *a;
    int h;
    a = (struct A0203eefc *)func_0203c900(1);
    h = (int)func_0204320c();
    if (h == 0) return 0xe;
    if (a->f15 == func_0203c814(self[0xd0d])) {
        a->f10 = func_020431f4();
    }
    func_020432d0();
    if (h == 0xb) return 0xf;
    *(unsigned char *)(self + 0x444 + (self[0xd13] << 2)) = 1;
    return 0xb;
}
