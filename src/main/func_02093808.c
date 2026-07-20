/* func_02093808: read CPSR processor mode (low 5 bits). Sibling of
 * OS_DisableIrq's mrs/msr family — mrs is privileged, no C equivalent.
 */

asm void func_02093808(void) {
    nofralloc
    mrs     r0, cpsr
    and     r0, r0, #0x1f
    bx      lr
}
