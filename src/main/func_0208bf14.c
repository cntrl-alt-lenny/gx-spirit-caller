/* func_0208bf14: waits for the DS division-hardware busy flag
 * (REG_DIVCNT, 0x04000280 bit 15) to clear, then returns the 64-bit
 * result (REG_DIVRESULT/REG_DIVREMRESULT) as {quotient, remainder} in
 * r0/r1. Ships as asm -- mwcc's small-struct return for this toolchain
 * always routes through a stack temp regardless of C form (a named
 * local and a compound-literal return both added an 8-byte stack
 * frame + extra loads/stores the original doesn't have).
 */

asm void func_0208bf14(void) {
    nofralloc
    ldr r1, =0x04000280
loop:
    ldrh r0, [r1]
    ands r0, r0, #0x8000
    bne loop
    ldr r1, =0x040002a0
    ldr r0, [r1]
    ldr r1, [r1, #0x4]
    bx lr
}
