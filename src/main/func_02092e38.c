/* func_02092e38: read CP15 c9/c1/0 (DTCM region register) and mask off
 * the size/enable bits, returning the base address (top 20 bits).
 * mrc is privileged, no C equivalent.
 */

asm void func_02092e38(void) {
    nofralloc
    mrc     p15, 0, r0, c9, c1, 0
    ldr     r1, =0xfffff000
    and     r0, r0, r1
    bx      lr
}
