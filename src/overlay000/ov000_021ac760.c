/* func_ov000_021ac760: extracts bit 2 of the word at +0x0.
 *
 *     ldr r0, [r0, #0x0]
 *     mov r0, r0, lsl #0x1d   ; 29
 *     mov r0, r0, lsr #0x1f   ; 31
 *     bx  lr
 */

unsigned int func_ov000_021ac760(void *p) {
    return (*(unsigned int *)p << 29) >> 31;
}
