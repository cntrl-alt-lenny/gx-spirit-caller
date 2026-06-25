/* CAMPAIGN-PREP candidate for func_0209c034 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: bind base in one local across all uses; if-do-while drain; eq->boolean ret
 *   risk:       orig holds base in r6 across ~5 uses and r4=base+0x10c in loop; if mwcc reloads data_021a84c0 the ldr/add counts diverge. reshape-able (single bound local + loop-invariant add).
 *   confidence: high
 */
/* func_0209c034: IRQ-guarded drain loop on flag bit 0x4, then return !*(*base). */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02091a8c(void *p);
extern char *data_021a84c0;

int func_0209c034(void) {
    char *base = data_021a84c0;
    int saved = OS_DisableIrq();
    if (*(int *)(base + 0x114) & 0x4) {
        do {
            func_02091a8c(base + 0x10c);
        } while (*(int *)(base + 0x114) & 0x4);
    }
    OS_RestoreIrq(saved);
    return **(int **)(base + 0x0) == 0;
}
