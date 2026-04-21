/* func_ov000_021abf40: zero-extend the low 16 bits of the word at +0x8.
 *
 *     ldr r0, [r0, #0x8]
 *     mov r0, r0, lsl #0x10
 *     mov r0, r0, lsr #0x10
 *     bx  lr
 */

unsigned int func_ov000_021abf40(void *p) {
    return (*(unsigned int *)((char *)p + 0x8) << 16) >> 16;
}
