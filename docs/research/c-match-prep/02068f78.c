/* CAMPAIGN-PREP candidate for func_02068f78 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     9-arg sig (a5..a9 stacked); a7=[sp+0x30] is guard+reused; store a8/a9/0 then two stacked-arg calls; alloc-guard movs
 *   risk:       stacked-arg spill order for the two 8-arg subcalls — mwcc may schedule the [sp]/[sp+4]/[sp+8]/[sp+0xc] stores in a different order than orig, diverging several str. permuter-class (arg-marshalling schedule).
 *   confidence: low
 */
/* func_02068f78 (main, class C) — init + two stacked-arg calls, struct stores */
extern int   data_0219e3f0;
extern void *func_020453e8(int size);
extern void  func_0206811c(void *p, int a, int b, int c, void *cb, void *self);
extern void  func_0206904c(void);
extern void  func_020690fc(void);
extern void  func_0206b31c(void *dst, int a1, int a2, int a3,
                           int a4, int a7, void *cb, void *self);

void *func_02068f78(int a1, int a2, int a3, int a4,
                    int a5, int a6, int a7, int a8, int a9) {
    unsigned char *p;

    if (a7 == 0) {
        if (data_0219e3f0 != 1) return 0;
    }
    p = func_020453e8(0x638);
    if (p == 0) return 0;

    *(int *)(p + 0x630) = a8;
    *(int *)(p + 0x634) = a9;
    *(int *)(p + 0x624) = 0;

    func_0206b31c(p + 0x4c, a1, a2, a3, a4, a7, func_020690fc, p);
    func_0206811c(p, a5, a6, a7, func_0206904c, p);
    return p;
}
