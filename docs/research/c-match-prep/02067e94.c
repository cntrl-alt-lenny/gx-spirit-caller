/* CAMPAIGN-PREP candidate for func_02067e94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order RMW preserved; if/else for ands ne/eq; sub acc-first; vtable blx via fn-ptr cast
 *   risk:       orig loads r3=[ctx+0x48] BEFORE ip=[ctx+0x44]; mwcc may evaluate the blx arg/fn-ptr loads in opposite order, swapping two ldr. permuter-class (scheduling).
 *   confidence: med
 */
/* func_02067e94 (main, class C) — flag RMW branch-tail + blx; store-order */
extern unsigned int data_02101d20;
extern int  func_02055330(void);
extern void func_02068380(void *p, void *q);
extern void func_0206880c(void *a, void *b);
extern int  func_020ab0c4(void *b, void *tag);

void func_02067e94(unsigned char *ctx, unsigned char *a, void *b) {
    int hit;
    unsigned char f;
    int t;

    hit = func_020ab0c4(b, &data_02101d20) != 0 ? 1 : 0;
    func_0206880c(a, b);
    if (hit == 0) return;

    f = a[0x14];
    if (f & 0x4) {
        a[0x14] = f | 0x41;
    } else {
        a[0x14] = f | 0x42;
    }
    f = a[0x14];
    a[0x14] = f & 0xf3;

    t = func_02055330();
    *(int *)(a + 0x1c) = t - *(int *)(a + 0x1c);
    func_02068380(ctx + 0x8, a);

    (*(void (**)(unsigned char *, int, unsigned char *, int))(ctx + 0x44))(
        ctx, 0, a, *(int *)(ctx + 0x48));
}
