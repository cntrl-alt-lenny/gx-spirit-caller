/* func_020954b4: IRQ-bracketed conditional global load — return
 * `data_021a6674 ? data_021a668c : data_021a6670`.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_020955dc
 *     ldr   r1, [r1, #0x0]
 *     cmp   r1, #0x0
 *     ldreq r1, .L_020955e0
 *     ldreq r4, [r1, #0x0]
 *     ldrne r1, .L_020955e4
 *     ldrne r4, [r1, #0x0]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_020955dc: .word data_021a6674
 *  .L_020955e0: .word data_021a6670
 *  .L_020955e4: .word data_021a668c
 *
 * Predicated load form (≤2 ops per branch, well within C-1
 * threshold). Style A epilogue.
 */

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

extern void *data_021a6674;
extern int   data_021a6670;
extern int   data_021a668c;

int func_020954b4(void) {
    int saved = OS_DisableIrq();
    int v = data_021a6674 == 0 ? data_021a6670 : data_021a668c;
    OS_RestoreIrq(saved);
    return v;
}
