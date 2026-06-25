/* CAMPAIGN-PREP candidate for func_020a5db0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ guard + store arg + ternary-into-call-arg (movne/moveq)
 *   risk:       the ?: into the call arg may emit cmp+branch instead of movne/moveq; data_021a9934 offset 0
 *   confidence: med
 */
/* func_020a5db0: IRQ-bracketed setter; if func_020a60c0()==0, kick
 * func_02092e6c(0xf000, arg ? 0x1000 : 0x5000). sp2p3 (.legacy.c).
 *
 *   r4 = OS_DisableIrq(); *data_021a9934 = arg;
 *   if (func_020a60c0() == 0)
 *       func_02092e6c(0xf000, (arg != 0) ? 0x1000 : 0x5000);
 *   OS_RestoreIrq(r4);
 *
 * asm: movne r1,#0x1000 / moveq r1,#0x5000 -> ne(true)=0x1000. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_020a60c0(void);
extern void func_02092e6c(int a, int b);

extern int data_021a9934;

void func_020a5db0(int arg) {
    int saved = OS_DisableIrq();
    data_021a9934 = arg;
    if (func_020a60c0() == 0) {
        func_02092e6c(0xf000, arg != 0 ? 0x1000 : 0x5000);
    }
    OS_RestoreIrq(saved);
}
