/* CAMPAIGN-PREP candidate for func_020a70fc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :3 bitfields give read lsl;lsr AND write bic;orr; re-read B per check; store-order
 *   risk:       struct-guessed: A/B bit positions and pad offsets (0xd,0x18,0x28) inferred. Also the func_020a6dc4!=0 branch returns -1 as 0-1 reusing the stored 0; mwcc may emit mvn instead of sub r0,r0,#1 (1-instr, reshape-able).
 *   confidence: low
 */
/* func_020a70fc: option/state validator with :3 bitfields (class D).
 * A@+4 read-only fields a_f2(bits2-4), a_f7(bits7-9); B@+8 b_lo3(bits0-2) RMW.
 * b_lo3=2/0 emit bic;orr / bic on the full word; reads emit lsl;lsr. */
extern int func_020a6ce0(void);
extern int func_020a6dc4(void *p, int x);

struct Obj70fc {
    char _pad0[4];
    /* +0x04 word A */
    unsigned int : 2;
    unsigned int a_f2 : 3;
    unsigned int : 2;
    unsigned int a_f7 : 3;
    unsigned int : 22;
    /* +0x08 word B */
    unsigned int b_lo3 : 3;
    unsigned int : 29;
    char _pad1[1];
    unsigned char flag_d;     /* +0x0d */
    char _pad2[0x18 - 0x0e];
    int f18;                  /* +0x18 */
    char _pad3[0x28 - 0x1c];
    int f28;                  /* +0x28 */
};

int func_020a70fc(struct Obj70fc *p) {
    if (p == 0)
        return func_020a6ce0();
    if (p->flag_d != 0)
        return -1;
    if (p->a_f7 == 0)
        return -1;
    if (p->a_f2 == 1)
        return 0;
    if (p->b_lo3 >= 3)
        p->b_lo3 = 2;
    if (p->b_lo3 == 2)
        p->f28 = 0;
    if (p->b_lo3 == 1) {
        if (func_020a6dc4(p, 0) != 0) {
            p->flag_d = 1;
            p->f28 = 0;
            return -1;
        }
        p->b_lo3 = 0;
        p->f18 = 0;
        p->f28 = 0;
        return 0;
    }
    p->b_lo3 = 0;
    return 0;
}
