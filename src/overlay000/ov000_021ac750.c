/* func_ov000_021ac750: extracts bit 17 of the word at +0x8.
 *
 *     ldr r0, [r0, #0x8]
 *     mov r0, r0, lsl #0xe    ; 14
 *     mov r0, r0, lsr #0x1f   ; 31
 *     bx  lr
 */

unsigned int func_ov000_021ac750(void *p) {
    return (*(unsigned int *)((char *)p + 0x8) << 14) >> 31;
}
