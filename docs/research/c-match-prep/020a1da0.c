/* CAMPAIGN-PREP candidate for func_020a1da0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base=*data in ip across two adds; mla (idx-1)*0x16+0x1340; IRQ bracket; return base+0x1772
 *   risk:       reshape-able: orig reloads *data_021a98fc once into ip and reuses it for both arg ptrs; if mwcc reloads per-use, an extra ldr appears. The (idx-1)*0x16 mla and 0x1772/0x1340 consts are the codegen pivot (reg-alloc).
 *   confidence: med
 */
/* func_020a1da0 (main, class C): IRQ-bracketed; if global base present and
 * idx valid, build record ptr = *data_021a98fc + 0x1340 + (idx-1)*0x16,
 * and a second ptr = *data_021a98fc + 0x1772, call func_02094688(rec, p2),
 * restore IRQ, return *data_021a98fc + 0x1772. Base held in ip across both
 * adds. arg: r0=idx (1-based).
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern char *data_021a98fc;          /* *base */
extern int  func_020a099c(int idx);  /* 1<=idx<=0xf validity */
extern void func_02094688(void *rec, void *p2);

char *func_020a1da0(int idx) {
    int saved = OS_DisableIrq();
    char *base;

    if (*(char **)data_021a98fc == 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    if (func_020a099c(idx) == 0) {
        OS_RestoreIrq(saved);
        return 0;
    }

    base = *(char **)data_021a98fc;
    func_02094688(base + 0x1340 + (idx - 1) * 0x16, base + 0x1772);
    OS_RestoreIrq(saved);

    base = *(char **)data_021a98fc;
    return base + 0x1772;
}
