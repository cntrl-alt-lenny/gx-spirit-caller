/* func_020338f8: critical-section + explicit-flag intermediate recipe.
 *
 * Brief 109 worked example — split-statement intermediate for
 * critical-section predicated cascade.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r4, r0                ; r4 = p
 *     mov   r5, #0x1              ; result = 1 (set BEFORE bl)
 *     bl    OS_DisableIrq
 *     ldr   r1, [r4, #0xeb4]
 *     mov   r4, r0                ; r4 = saved IRQ state
 *     tst   r1, #0x2000
 *     movne r0, r5                ; flag = (bit set) ? 1 : 0
 *     moveq r0, #0x0
 *     cmp   r0, #0x0
 *     moveq r5, #0x0              ; if (flag == 0) result = 0
 *     beq   .L_skip
 *     bl    func_02046ae0
 *     cmp   r0, #0x1
 *     movle r5, #0x0              ; if (helper() <= 1) result = 0
 *  .L_skip:
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     mov   r0, r5
 *     ldmia sp!, {r3, r4, r5, pc}
 *
 * Recipe — natural form COMBINES the tst+early-return+bl+cmp+movle
 * cascade into a more efficient mwcc 2.0 predication shape. Explicit
 * intermediate flag variable forces materialization into r0 via
 * movne/moveq, which a separate cmp+beq+moveq then drains into r5.
 * Same family as C-25 (split bitfield-chain) and C-26 (helper
 * signature). 6-variant × 15-SP sweep: variant B (explicit ternary
 * intermediate) byte-matches at all 10 mwcc 2.0/* SPs.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_02046ae0(void);

struct s338f8 {
    char _pad[0xeb4];
    int  flag_eb4;
};

int func_020338f8(struct s338f8 *p) {
    int saved;
    int flag;
    int result = 1;
    saved = OS_DisableIrq();
    flag = (p->flag_eb4 & 0x2000) ? 1 : 0;
    if (flag == 0) {
        result = 0;
    } else {
        if (func_02046ae0() <= 1) result = 0;
    }
    OS_RestoreIrq(saved);
    return result;
}
