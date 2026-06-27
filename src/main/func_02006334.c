/* func_02006334: IRQ-bracketed Task_PostLocked with fixed args.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r4, r0
 *     bl    OS_DisableIrq               ; saved = disable IRQs
 *     mov   r5, r0
 *     mov   r0, r4                      ; arg0 = caller's p
 *     mvn   r1, #0x3                    ; arg1 = -4 (~3)
 *     mov   r2, #0x3                    ; arg2 = 3
 *     bl    Task_PostLocked
 *     mov   r4, r0                      ; cache result
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r3, r4, r5, pc}
 *
 * 13 insns, 0x34 bytes.
 *
 * Task_PostLocked already locks internally — the outer OS_DisableIrq
 * / OS_RestoreIrq bracket is defense-in-depth or a legacy shape
 * (same pattern as Task_InvokeLockedIrq in #198).
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int  Task_PostLocked(void *arg0, int arg1, int arg2);

int func_02006334(void *p) {
    int saved = OS_DisableIrq();
    int result = Task_PostLocked(p, -4, 3);
    OS_RestoreIrq(saved);
    return result;
}
