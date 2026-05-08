/* func_02095554: IRQ-bracketed wrap-aware "arg <= data_021a6750"
 * comparison. Returns 1 if the (signed) difference (arg - data)
 * is <= 0 — i.e. arg is at or older than the stored counter when
 * accounting for 32-bit wrap.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_020955a4
 *     ldr   r1, [r1, #0x0]
 *     cmp   r4, r1
 *     bls   .L_02095584
 *     sub   r1, r4, r1
 *     cmp   r1, #0x80000000
 *     movlo r4, #0x0
 *     movhs r4, #0x1
 *     b     .L_02095594
 *  .L_02095584:
 *     sub   r1, r1, r4
 *     cmp   r1, #0x80000000
 *     movlo r4, #0x1
 *     movhs r4, #0x0
 *  .L_02095594:
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_020955a4: .word data_021a6750
 *
 * The asm picks the smaller-magnitude diff (whichever subtraction
 * doesn't overflow into the high half) and tests against
 * 0x80000000 — the canonical wrap-aware comparison shape.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern unsigned int data_021a6750;

int func_02095554(unsigned int arg) {
    int saved = OS_DisableIrq();
    unsigned int v;
    if (arg > data_021a6750) {
        if ((arg - data_021a6750) < 0x80000000u) v = 0;
        else v = 1;
    } else {
        if ((data_021a6750 - arg) < 0x80000000u) v = 1;
        else v = 0;
    }
    OS_RestoreIrq(saved);
    return v;
}
