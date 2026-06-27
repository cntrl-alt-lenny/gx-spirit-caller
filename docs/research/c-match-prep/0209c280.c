/* CAMPAIGN-PREP candidate for func_0209c280 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: params a,b->r7/r6; bind base r5; mvn#2 held in r8 across loop -> ~0x2 literal
 *   risk:       orig hoists r8=~0x2 once and reuses across cmp+loop+store; mwcc may rematerialise mvn each compare (extra movs). reshape-able only partly -- the r8 hoist is scheduler-driven, lean permuter-class.
 *   confidence: med
 */
/* func_0209c280: IRQ-protected acquire; drain list if owner busy, then set owner, inc refcount. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern char *data_021a84c0;
extern void func_02091a8c(void *p);
extern void func_02093bfc(void);

void func_0209c280(int a, int b) {
    char *base = data_021a84c0;
    int saved = OS_DisableIrq();
    if (*(int *)(base + 0x8) == a) {
        if (*(int *)(base + 0x18) != b)
            func_02093bfc();
    } else {
        if (*(int *)(base + 0x8) != ~0x2) {
            do {
                func_02091a8c(base + 0x10);
            } while (*(int *)(base + 0x8) != ~0x2);
        }
        *(int *)(base + 0x8) = a;
        *(int *)(base + 0x18) = b;
    }
    *(int *)(base + 0xc) += 1;
    *(int *)(*(int **)(base + 0x0)) = 0;
    OS_RestoreIrq(saved);
}
