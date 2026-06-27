/* Task_InvokeLockedIrq: IRQ-bracketed Task_InvokeLocked(p) with null-skip —
 * same semantics as the plain wrapper but the IRQ lock is explicit
 * at this level (Task_InvokeLocked already locks internally, so
 * nesting is defense-in-depth or a legacy shape).
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r0
 *     bl    OS_DisableIrq
 *     mov   r4, r0                     ; save mask
 *     cmp   r5, #0x0
 *     beq   .L_02006388                 ; null → skip dispatch
 *     mov   r0, r5
 *     bl    Task_InvokeLocked
 *   .L_02006388:
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void Task_InvokeLocked(void *p);

void Task_InvokeLockedIrq(void *p) {
    int saved = OS_DisableIrq();
    if (p != 0) Task_InvokeLocked(p);
    OS_RestoreIrq(saved);
}
