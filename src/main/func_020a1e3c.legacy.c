/* func_020a1e3c: IRQ-bracketed store of arg to (data->p + 0x1000)->f_4e4.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_020a1e64
 *     ldr   r1, [r1, #0x0]
 *     add   r1, r1, #0x1000
 *     str   r4, [r1, #0x4e4]
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_020a1e64: .word data_021a98fc
 *
 * Cloud verified byte-identical with sp2p3 in brief 036's research
 * note (docs/research/style-a-epilogue.md).
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    char _pad[0x14e4];
    int  f_14e4;
} state_021a98fc_inner_t;

extern state_021a98fc_inner_t *data_021a98fc;

void func_020a1e3c(int arg) {
    int saved = OS_DisableIrq();
    data_021a98fc->f_14e4 = arg;
    OS_RestoreIrq(saved);
}
