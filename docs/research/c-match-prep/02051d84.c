/* CAMPAIGN-PREP candidate for func_02051d84 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload func_020498f0() per use (no bind); same-target guard chain; blx via fn-ptr param
 *   risk:       Guard chain calls 020469b4/020498f0 repeatedly; if mwcc CSEs/binds the context pointer instead of reloading per call, the ldr-after-bl pattern diverges. reshape-able (keep separate calls; do not introduce a base local).
 *   confidence: med
 */
/* func_02051d84 — main, cls C. Guard chain + blx callback. COMPLETE source.
   func_020498f0() returns a context pointer; orig RE-CALLS it each use (reload),
   so we deref a fresh call each time rather than binding the pointer. */
extern int  func_02045280(void);
extern unsigned char *func_020498f0(void); /* context base */
extern int  func_020469b4(void);
extern void func_0204f820(void);

typedef void (*Cb)(int arg);

int func_02051d84(Cb cb, int arg)
{
    if (func_02045280() != 0)
        return 0;
    if (func_020498f0() == 0)
        return 0;
    if (func_020498f0()[0x15] != 2)
        return 0;
    if (func_020469b4() != 5 && func_020469b4() != 6)
        return 0;

    /* .L_328 */
    if (*(int *)(func_020498f0() + 0x1a0) == 0xa) {
        unsigned char *p = func_020498f0();
        p[0x16] = func_020498f0()[0xd];
        func_0204f820();
        if (cb != 0)
            cb(arg);
    } else {
        /* .L_364 */
        *(Cb *)(func_020498f0() + 0x47c) = cb;
        *(int *)(func_020498f0() + 0x480) = arg;
        func_020498f0()[0x1ae] = 1;
    }
    return 1;
}
