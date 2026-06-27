/* CAMPAIGN-PREP candidate for func_02044528 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base+0x100/+0xf0 (r4/r6); inline base+0x200 (recomputed twice); func_02043a78(arg0); do-while
 *   risk:       permuter-class: same many-invariant reg-alloc pressure as 02044384 plus arg0 must survive in a callee-saved reg across func_02043a78; reg rotation among r4-fp is the likely diverge.
 *   confidence: med
 */
extern int data_0219da78;
extern int data_0219da7c;
extern void func_02043a78(void *a);
extern int func_02043b70();
extern int func_02043bdc(void *a, int b, int c, void *d);
extern int func_02043c28(int a, int b, void *c);
extern int func_02043ca4(int a, int b, void *c);
extern void func_02093bfc();
extern void func_02094688(void *src, void *dst, int len);
extern unsigned short func_020a6720(void *a, void *b, int c);
extern void func_020a6858(void *a, int b);

int func_02044528(void *arg0, unsigned char *base)
{
    int h = data_0219da78;
    void *r4 = base + 0x100;
    void *r6 = base + 0xf0;
    int i;

    func_02043a78(arg0);
    func_020a6858(base + 0x200, 0xa001);
    for (i = 0; i < 2; i++) {
        if (func_02043ca4(h, 0x100, base) == 0) {
            func_02093bfc();
            return 0;
        }
        func_02094688(&data_0219da7c, r6, 0xe);
        *(unsigned short *)(base + 0xfe) = func_020a6720(base + 0x200, base, 0xfe);
        do {
            func_02043c28(h, 0x100, base);
        } while (func_02043bdc(base, h, 0x100, r4) == 0);
        h += 0x100;
    }
    return func_02043b70() != 0;
}
