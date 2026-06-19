/* func_020918a4: IRQ-bracketed call wrapper. Saves disable-mask
 * to r4, calls func_02091ea0, restores. Style A epilogue
 * (`pop {r4, lr}; bx lr`) → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     mov   r4, r0
 *     bl    func_02091ea0
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int  func_02091ea0(void);

void func_020918a4(void) {
    int saved = OS_DisableIrq();
    func_02091ea0();
    OS_RestoreIrq(saved);
}
