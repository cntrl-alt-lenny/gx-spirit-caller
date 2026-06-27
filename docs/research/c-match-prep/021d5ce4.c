/* CAMPAIGN-PREP candidate for func_021d5ce4 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual-return modelled as long long (lo=r5,hi=r6); decl hi/lo for r6-then-r5 alloc; callbacks 021d5b14 on r3, 021d5b9c on stack via str ip
 *   risk:       permuter-class/struct-guessed: 64-bit return ABI for 02031c1c is inferred (it sets r0:r1); mwcc's lo/hi reg numbering (r6 assigned before r5) + the movs-test on the handle are decl-order coin-flips a C reshape may not pin.
 *   confidence: low
 */
/* func_ov004_021d5ce4: acquire a 0x4138 handle (02031d80), prime it (02034754),
 * fetch a {lo,hi} pair via 02031c1c (callbacks 021d5b14/021d5b9c on r3/stack); if
 * the pair is nonzero AND 021d5bdc(h)>=0 keep it, else release (02031d0c) and
 * return {0,0}. Returns the 2-word pair in r0:r1. */
extern void *func_02031d80(int a, int b, int c);
extern void func_02034754(void *h, int n);
extern long long func_02031c1c(void *h, int b, int c, void *cb4, void *cb5);
extern void func_02031d0c(void *h);
extern int  func_ov004_021d5bdc(void *h);
extern void func_ov004_021d5b14(void);
extern void func_ov004_021d5b9c(void);

long long func_ov004_021d5ce4(void) {
    int hi, lo;
    void *h = func_02031d80(0x4138, 0, 0x7000000);
    if (h != 0) {
        long long v;
        func_02034754(h, 0x4138);
        v = func_02031c1c(h, 0, 0x7000000, func_ov004_021d5b14, func_ov004_021d5b9c);
        lo = (int)v;
        hi = (int)(v >> 32);
        if ((hi != 0 || lo != 0) && func_ov004_021d5bdc(h) >= 0)
            return ((long long)hi << 32) | (unsigned int)lo;
        func_02031d0c(h);
    }
    lo = 0;
    hi = 0;
    return ((long long)hi << 32) | (unsigned int)lo;
}
