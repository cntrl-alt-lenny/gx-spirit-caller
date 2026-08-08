/* func_020a39ec: IRQ-bracketed conditional dispatch. Style A (2-step epilogue).
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, =data_021a98fc
 *     mov   r4, r0
 *     ldr   r0, [r1]
 *     add   r0, r0, #0x1000
 *     ldr   r0, [r0, #0x320]
 *     cmp   r0, #0x0
 *     bne   .L_1d4
 *     bl    func_02093bfc
 *   .L_1d4:
 *     bl    func_020a3a2c
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

typedef struct { char _pad[0x1000]; } region_t;
extern region_t *data_021a98fc;
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02093bfc(void);
extern void func_020a3a2c(void);

void func_020a39ec(void) {
    int saved = OS_DisableIrq();
    if (*(int *)((char *)data_021a98fc + 0x1000 + 0x320) == 0) {
        func_02093bfc();
    }
    func_020a3a2c();
    OS_RestoreIrq(saved);
}
