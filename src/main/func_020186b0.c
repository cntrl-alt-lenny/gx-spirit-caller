/* func_020186b0: bit 0 extract of GetSystemWork()->field_0x8d8.
 * Already documented as a wall: mwcc's `(v << 31) >> 31` optimizes to
 * `and r0, r0, #1` (1 insn) instead of the baserom's 2-insn
 * lsl+lsr-with-flags shape. Ships as asm to match exactly.
 */

extern void *GetSystemWork(void);

asm void func_020186b0(void) {
    nofralloc
    stmdb   sp!, {r3, lr}
    bl      GetSystemWork
    ldr     r0, [r0, #0x8d8]
    mov     r0, r0, lsl #0x1f
    movs    r0, r0, lsr #0x1f
    ldmia   sp!, {r3, pc}
}
