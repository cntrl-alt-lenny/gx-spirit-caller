/* func_0209d5fc: IRQ-bracketed null-checked load with u16 zero-extend.
 * Return `data->p ? (uint16_t)data->p->f_14c : 0`.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_0209d720
 *     ldr   r1, [r1, #0x0]
 *     cmp   r1, #0x0
 *     ldrne r4, [r1, #0x14c]
 *     moveq r4, #0x0
 *     bl    OS_RestoreIrq
 *     mov   r0, r4, lsl #0x10
 *     mov   r0, r0, lsr #0x10
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_0209d720: .word data_021a8c4c
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    char _pad[0x14c];
    int  f_14c;
} state_021a8d2c_inner_t;

extern state_021a8d2c_inner_t *data_021a8c4c;

unsigned short func_0209d5fc(void) {
    int saved = OS_DisableIrq();
    int v = data_021a8c4c ? data_021a8c4c->f_14c : 0;
    OS_RestoreIrq(saved);
    return (unsigned short)v;
}
