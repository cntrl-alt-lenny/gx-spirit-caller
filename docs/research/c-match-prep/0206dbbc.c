/* CAMPAIGN-PREP candidate for func_0206dbbc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ-bracket + bind base, reload [r4] in drain loop
 *   risk:       global must reload each iter; if mwcc hoists *p the loop body diverges
 *   confidence: high
 */
/* func_0206dbbc: IRQ-bracketed drain loop.
 *   bl OS_DisableIrq; r5=saved; r4=&data_0219ed4c (held across loop)
 *   while (*r4 != 0) func_0206dcb4();
 *   OS_RestoreIrq(saved);
 * The base pointer is bound in r4, but [r4] is re-loaded every
 * iteration (the called worker mutates it). A plain global read in a
 * while-condition re-reads it because mwcc cannot prove func_0206dcb4
 * leaves it unchanged.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_0206dcb4(void);
extern int  data_0219ed4c;

void func_0206dbbc(void) {
    int saved = OS_DisableIrq();
    while (data_0219ed4c != 0) {
        func_0206dcb4();
    }
    OS_RestoreIrq(saved);
}
