/* func_0209d724: IRQ-bracketed null-checked halfword load — return
 * `data->p ? data->p->h_150 : 0` (offset = 0x100 + 0x50 = 0x150).
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_0209d754
 *     ldr   r1, [r1, #0x0]
 *     cmp   r1, #0x0
 *     addne r1, r1, #0x100
 *     ldrneh r4, [r1, #0x50]
 *     moveq r4, #0x0
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_0209d754: .word data_021a8d2c
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    char           _pad[0x150];
    unsigned short h_150;
} state_021a8d2c_h150_t;

extern state_021a8d2c_h150_t *data_021a8d2c;

int func_0209d724(void) {
    int saved = OS_DisableIrq();
    state_021a8d2c_h150_t *p = data_021a8d2c;
    int v = p ? p->h_150 : 0;
    OS_RestoreIrq(saved);
    return v;
}
