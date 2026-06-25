/* CAMPAIGN-PREP candidate for func_0209cc90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: load cb(0x38)/arg(0x3c) into r6/r5 BEFORE OS_DisableIrq; bind base r7; bic ~0x4c
 *   risk:       orig loads r6=[0x38],r5=[0x3c] before the irq-disable and survives the call (callee-saved); if mwcc reloads after OS_RestoreIrq the ldr placement diverges. reshape-able by hoisting the two loads above OS_DisableIrq as written.
 *   confidence: med
 */
/* func_0209cc90: teardown -- optional vtable[0] callback, clear, mask flags, optional 0x38 callback. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern char *data_021a84c0;
extern char *data_021a8b00;
extern void func_020919d8(void *p);
extern void func_02091a0c(void *p);
extern void func_0209cd3c(void);
extern int  func_0209d1f0(void *p);
extern void func_0209d4ec(void);

void func_0209cc90(void) {
    char *p = data_021a8b00;
    if (func_0209d1f0(p)) {
        (*(void (**)(void *))p)(p);
    }
    {
        char *base = data_021a84c0;
        int cb_arg;
        void (*cb)(int);
        int saved;
        func_0209cd3c();
        func_0209d4ec();
        *(int *)(*(int **)(base + 0x0)) = 0;
        cb = *(void (**)(int))(base + 0x38);
        cb_arg = *(int *)(base + 0x3c);
        saved = OS_DisableIrq();
        *(int *)(base + 0x114) = *(int *)(base + 0x114) & ~0x4c;
        func_02091a0c(base + 0x10c);
        if (*(int *)(base + 0x114) & 0x10)
            func_020919d8(base + 0x44);
        OS_RestoreIrq(saved);
        if (cb) {
            cb(cb_arg);
        }
    }
}
