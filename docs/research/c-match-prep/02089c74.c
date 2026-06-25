/* CAMPAIGN-PREP candidate for func_02089c74 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD (movs early-return) + IRQ bracket + guarded call
 *   risk:       Guard movs on p1 needs p1 second arg; void return matches (epilogue sets no r0). Reg cache order may flip.
 *   confidence: high
 */
/* func_02089c74: IRQ-bracketed wrap with one early-out guard.
 *
 *   r7=p0, r5/movs=p1 (early return if p1==0), r6=p2
 *   saved = OS_DisableIrq()
 *   r5 = func_02089400(p1)
 *   if (p0 == func_02089024(p2)) func_02089008(p2, 0)
 *   func_02089400(r5)
 *   OS_RestoreIrq(saved)
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02089008(int a, int b);
extern int  func_02089024(int a);
extern int  func_02089400(int a);

void func_02089c74(int p0, int p1, int p2) {
    int saved;
    int h;

    if (p1 == 0) return;

    saved = OS_DisableIrq();
    h = func_02089400(p1);
    if (p0 == func_02089024(p2)) {
        func_02089008(p2, 0);
    }
    func_02089400(h);
    OS_RestoreIrq(saved);
}
