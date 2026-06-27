/* CAMPAIGN-PREP candidate for func_0203dc10 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: param pointer reused (r4) for all *p stores; if-chain matches bhi/bne/bcs; predicated strb from moveq pattern
 *   risk:       The r==1 / r==-1 ladder compiles as cmp #1; moveq...; then mvn r1,#0; cmp r0,r1. mwcc may emit cmn r0,#1 instead of mvn+cmp for the ==-1 test -- reshape-able by writing the -1 compare as a distinct branch (kept the early return so it stays a separate cmp).
 *   confidence: med
 */
/* func_0203dc10 - main - class C
 * state-advance on *r4 (a byte); predicated strb writes the next state.
 * r4 holds the param pointer throughout; result is a small set of consts.
 */
extern int  func_0203db70(void);
extern int  func_0203db24(void);
extern void func_02043250(void);
extern void func_020432d0(void);

int func_0203dc10(unsigned char *p)
{
    int st;
    int r;

    st = *p;
    if (st <= 0xa) {
        r = func_0203db70();
        if (r == 1) {
            *p = 0;
            return 1;
        }
        if (r == -1) {
            *p = 0x12;
            return 1;
        }
        return 0;
    }
    if (st == 0xe) {
        func_02043250();
        func_020432d0();
        *p = 0xc;
        return 0;
    }
    if (st < 0x12) {
        if (func_0203db24() == 1)
            *p = 0xa;
    }
    return 0;
}
