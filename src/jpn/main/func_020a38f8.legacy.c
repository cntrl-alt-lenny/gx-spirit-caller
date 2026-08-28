/* func_020a38f8: IRQ-bracketed conditional dispatch. Style A (2-step epilogue).
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, =data_021a981c
 *     mov   r4, r0
 *     ldr   r0, [r1]
 *     add   r0, r0, #0x1000
 *     ldr   r0, [r0, #0x320]
 *     cmp   r0, #0x0
 *     bne   .L_1d4
 *     bl    func_02093b08
 *   .L_1d4:
 *     bl    func_020a3938
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

typedef struct { char _pad[0x1000]; } region_t;
extern region_t *data_021a981c;
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02093b08(void);
extern void func_020a3938(void);

void func_020a38f8(void) {
    int saved = OS_DisableIrq();
    if (*(int *)((char *)data_021a981c + 0x1000 + 0x320) == 0) {
        func_02093b08();
    }
    func_020a3938();
    OS_RestoreIrq(saved);
}
