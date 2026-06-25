/* CAMPAIGN-PREP candidate for func_0209c1dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: a,b in r7/r6 -> declare params in that order; bind base; mirror branch nesting
 *   risk:       the (8!=a)||(c==0) short-circuit must emit cmp r7;bne / cmp#0;bne to .L_138 in that order; mwcc may invert the OR test. reshape-able via explicit if-order; minor permuter-class on r4/saved.
 *   confidence: med
 */
/* func_0209c1dc: IRQ-guarded refcount dec / teardown, branchy. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern char *data_021a84c0;
extern void func_02091a0c(void *p);
extern void func_02093bfc(void);

void func_0209c1dc(int a, int b) {
    char *base = data_021a84c0;
    int saved = OS_DisableIrq();
    if (*(int *)(base + 0x8) != a || *(int *)(base + 0xc) == 0) {
        func_02093bfc();
    } else {
        if (*(int *)(base + 0x18) != b)
            func_02093bfc();
        *(int *)(base + 0xc) -= 1;
        if (*(int *)(base + 0xc) == 0) {
            *(int *)(base + 0x8) = ~0x2;
            *(int *)(base + 0x18) = 0;
            func_02091a0c(base + 0x10);
        }
    }
    *(int *)(*(int **)(base + 0x0)) = 0;
    OS_RestoreIrq(saved);
}
