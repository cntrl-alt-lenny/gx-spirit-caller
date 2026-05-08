/* func_0207b5f8: IRQ-bracketed null-checked load — return
 * `data->p ? data->p->f_2260 : 0` (offset = 0x2000 + 0x260).
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_0207b628
 *     mov   r4, #0x0
 *     ldr   r1, [r1, #0x0]
 *     cmp   r1, #0x0
 *     addne r1, r1, #0x2000
 *     ldrne r4, [r1, #0x260]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_0207b628: .word data_021a088c
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    char _pad[0x2260];
    int  f_2260;
} state_021a088c_inner_t;

extern state_021a088c_inner_t *data_021a088c;

int func_0207b5f8(void) {
    int saved = OS_DisableIrq();
    int v = 0;
    state_021a088c_inner_t *p = data_021a088c;
    if (p) {
        v = p->f_2260;
    }
    OS_RestoreIrq(saved);
    return v;
}
