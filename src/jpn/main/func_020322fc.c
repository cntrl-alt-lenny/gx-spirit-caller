/* func_020322fc: IRQ-bracketed global u32 getter — `return *data_0219b1d4`.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_0203236c
 *     ldr   r4, [r1, #0x0]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, pc}
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int  data_0219b1d4;

int func_020322fc(void) {
    int saved = OS_DisableIrq();
    int v = data_0219b1d4;
    OS_RestoreIrq(saved);
    return v;
}
