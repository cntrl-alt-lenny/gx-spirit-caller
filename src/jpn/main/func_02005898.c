/* func_02005898: IRQ-bracketed VBlank-flag clear.
 * Disables VBlank IE bit, clears data_02103fcc[0x4], re-enables VBlank.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, .L_020058e8            ; r0 = REG_IE (0x04000210)
 *     ldr   r0, [r0, #0x0]             ; read IE
 *     bic   r0, r0, #0x1               ; clear VBlank bit
 *     bl    func_02090574              ; write IE (sys-level IE writer)
 *     ldr   r0, .L_020058ec            ; r0 = &data_02103fcc
 *     mov   r2, #0x0
 *     ldr   r1, .L_020058e8            ; r1 = REG_IE (reload — mwcc's
 *                                      ;   2nd pool ref, NOT deduped)
 *     str   r2, [r0, #0x4]             ; data_02103fcc[0x4] = 0
 *     ldr   r0, [r1, #0x0]             ; re-read IE
 *     orr   r0, r0, #0x1               ; set VBlank bit
 *     bl    func_02090574              ; write IE
 *     ldmia sp!, {r3, pc}
 *   .L_020058e8: .word 0x4000210      ; REG_IE
 *   .L_020058ec: .word data_02103fcc
 *
 * 12 ARM instructions + 2 pool words, 0x3c bytes.
 *
 * Pool quirk: REG_IE address (0x04000210) appears TWICE in the pool,
 * not deduped — mwcc's pool manager keeps two copies because the two
 * uses span a register-lifetime boundary (r0 and r1 separately).
 *
 * Semantic: ~"clear VBlank interrupt pending flag" — disable VBlank
 * IRQ delivery briefly, zero a 4-byte flag in a state struct, restore
 * IRQ. Classic NitroSDK OS_ClearIrqCheckFlag-shape pattern, but on a
 * distinct data struct (not OSi_IrqCheckBuf from #178).
 */

extern unsigned int func_02090574(unsigned int value);
extern char data_02103fcc[];

void func_02005898(void) {
    volatile unsigned int *reg_ie = (volatile unsigned int *)0x04000210;
    func_02090574(*reg_ie & ~1u);
    *(int *)(data_02103fcc + 0x4) = 0;
    func_02090574(*reg_ie | 1u);
}
