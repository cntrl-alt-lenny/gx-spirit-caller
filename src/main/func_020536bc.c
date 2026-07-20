/* func_020536bc: 2-u32 setter at offsets 0x4 and 0x8. Ships as asm
 * because mwcc fuses adjacent stores into stmia; the original uses
 * two separate str instructions.
 */

asm void func_020536bc(void) {
    nofralloc
    str     r1, [r0, #0x4]
    str     r2, [r0, #0x8]
    bx      lr
}
