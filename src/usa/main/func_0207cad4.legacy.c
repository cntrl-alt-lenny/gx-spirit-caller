/* func_0207cad4: IRQ-bracketed store of arg to data_021a07b0[+0x28].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_0207cbdc
 *     str   r4, [r1, #0x28]
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_0207cbdc: .word data_021a07b0
 *
 * Cloud verified byte-identical with sp2p3 in brief 036's research note.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    char _pad[0x28];
    int  f_28;
} state_021a0890_t;

extern state_021a0890_t data_021a07b0;

void func_0207cad4(int arg) {
    int saved = OS_DisableIrq();
    data_021a07b0.f_28 = arg;
    OS_RestoreIrq(saved);
}
