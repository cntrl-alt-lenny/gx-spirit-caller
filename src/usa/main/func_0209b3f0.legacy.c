/* func_0209b3f0: IRQ-bracketed test-and-set on data_021a8304.
 * Returns 1 if it acquired (was 0, set to 1); 0 if already set.
 * Has Style A epilogue (sub sp #4 + ldmia {lr} + bx).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_0209b530
 *     ldr   r2, [r1, #0x0]
 *     cmp   r2, #0x0
 *     beq   .L_0209b514
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     mov   r0, #0x0
 *     ldmia sp!, {lr}
 *     bx    lr
 *  .L_0209b514:
 *     mov   r2, #0x1
 *     str   r2, [r1, #0x0]
 *     bl    OS_RestoreIrq
 *     mov   r0, #0x1
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 *  .L_0209b530: .word data_021a8304
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int  data_021a8304;

int func_0209b3f0(void) {
    int saved = OS_DisableIrq();
    if (data_021a8304 != 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    data_021a8304 = 1;
    OS_RestoreIrq(saved);
    return 1;
}
