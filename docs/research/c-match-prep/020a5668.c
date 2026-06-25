/* CAMPAIGN-PREP candidate for func_020a5668 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ guard + early-out + pointer-deref +0xc4 tail call
 *   risk:       data_021a9920 deref depth and +0xc4 field offset guessed; confirm struct
 *   confidence: med
 */
/* func_020a5668: IRQ-bracketed; if func_020a5878() nonzero, call
 * func_020a56bc(base+0xc4, 0, arg, 0). sp2p3 (.legacy.c).
 *
 *   r5 = arg; r4 = OS_DisableIrq();
 *   if (func_020a5878()) {
 *       r0 = *data_021a9920; func_020a56bc(r0 + 0xc4, 0, arg, 0);
 *   }
 *   OS_RestoreIrq(r4);
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_020a5878(void);
extern void func_020a56bc(void *p, int a, int b, int c);

extern char *data_021a9920;   /* pointer to a byte region; field at +0xc4 */

void func_020a5668(int arg) {
    int saved = OS_DisableIrq();
    if (func_020a5878() != 0) {
        func_020a56bc(data_021a9920 + 0xc4, 0, arg, 0);
    }
    OS_RestoreIrq(saved);
}
