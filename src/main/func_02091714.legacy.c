/* func_02091714: IRQ-bracketed swap of `data_021a63d0[0xc]` with arg,
 * return previous value.
 *
 *     stmdb sp!, {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r0
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_02091744
 *     ldr   r4, [r1, #0xc]
 *     str   r5, [r1, #0xc]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     add   sp, sp, #0x4
 *     ldmia sp!, {r4, r5, lr}
 *     bx    lr
 *  .L_02091744: .word data_021a63d0
 *
 * Two callee-save (r4 = old, r5 = arg) + sub sp #4 alignment slot.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    char _pad[0xc];
    int  f_c;
} state_021a63d0_t;

extern state_021a63d0_t data_021a63d0;

int func_02091714(int arg) {
    int saved = OS_DisableIrq();
    int old = data_021a63d0.f_c;
    data_021a63d0.f_c = arg;
    OS_RestoreIrq(saved);
    return old;
}
