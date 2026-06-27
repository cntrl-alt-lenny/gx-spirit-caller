/* CAMPAIGN-PREP candidate for func_0209d018 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: subs sets the branch; load 0x1c/0x20/0x24 as a trio then add/sub then store trio (asm order)
 *   risk:       the 0x24 counter is reloaded into base via fresh ldr _LIT0 (orig re-derives base after the first call); and the teardown tail reloads cb/arg into r6/r5 before OS_DisableIrq. reshape-able (re-read global, hoist loads); trio scheduling lean permuter-class.
 *   confidence: low
 */
/* func_0209d018: advance counters by 0x200; when the 0x24 counter hits 0, full teardown, else tail call. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern char *data_021a84c0;
extern void func_020905a8(int n);
extern void func_020905dc(int n);
extern void func_020919d8(void *p);
extern void func_02091a0c(void *p);
extern void func_02093d44(int a);
extern void func_0209cd3c(void);
extern void func_0209d0f8(void);
extern void func_0209d4ec(void);

void func_0209d018(void) {
    char *base = data_021a84c0;
    func_02093d44(*(int *)(base + 0x28));
    base = data_021a84c0;
    *(int *)(base + 0x1c) += 0x200;
    *(int *)(base + 0x20) += 0x200;
    *(int *)(base + 0x24) -= 0x200;
    if (*(int *)(base + 0x24) != 0) {
        func_0209d0f8();
        return;
    }
    func_020905dc(0x80000);
    func_020905a8(0x80000);
    {
        char *b = data_021a84c0;
        int cb_arg;
        void (*cb)(int);
        int saved;
        func_0209cd3c();
        func_0209d4ec();
        *(int *)(*(int **)(b + 0x0)) = 0;
        cb = *(void (**)(int))(b + 0x38);
        cb_arg = *(int *)(b + 0x3c);
        saved = OS_DisableIrq();
        *(int *)(b + 0x114) = *(int *)(b + 0x114) & ~0x4c;
        func_02091a0c(b + 0x10c);
        if (*(int *)(b + 0x114) & 0x10)
            func_020919d8(b + 0x44);
        OS_RestoreIrq(saved);
        if (cb) {
            cb(cb_arg);
        }
    }
}
