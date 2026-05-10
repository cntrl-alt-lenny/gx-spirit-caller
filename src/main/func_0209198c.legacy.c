/* func_0209198c: IRQ-bracketed call wrapper. Saves disable-mask
 * to r4, calls func_02091f88, restores. Style A epilogue
 * (`pop {r4, lr}; bx lr`) → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     mov   r4, r0
 *     bl    func_02091f88
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int  func_02091f88(void);

void func_0209198c(void) {
    int saved = OS_DisableIrq();
    func_02091f88();
    OS_RestoreIrq(saved);
}
