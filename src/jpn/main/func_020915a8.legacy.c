/* func_020915a8: IRQ-bracketed pre-decrement counter — if
 * `data_021a62dc != 0`, decrement and return old value; else 0.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_020916c4
 *     mov   r4, #0x0
 *     ldr   r3, [r1, #0x0]
 *     cmp   r3, #0x0
 *     subne r2, r3, #0x1
 *     movne r4, r3
 *     strne r2, [r1, #0x0]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_020916c4: .word data_021a62dc
 *
 * 13 insns + 1 pool word = 0x38 bytes. Routed via `.legacy.c`
 * (mwcc 1.2/sp2p3) for the Style A epilogue
 * (`stmdb {r4, lr}; ...; ldmia {r4, lr}; bx lr`); mwcc 2.0/sp1p5
 * defaults to Style B (`stmdb {r3, r4, lr}; ...; ldmia {r3, r4, pc}`).
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

extern unsigned int data_021a62dc;

unsigned int func_020915a8(void) {
    int saved = OS_DisableIrq();
    unsigned int v = 0;
    unsigned int c = data_021a62dc;
    if (c != 0) {
        v = c;
        data_021a62dc = c - 1;
    }
    OS_RestoreIrq(saved);
    return v;
}
