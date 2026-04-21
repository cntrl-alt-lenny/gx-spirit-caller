/* func_ov000_021abe54: 9-bit field extract — reads a word at +0xc,
 * shifts it left 6 then right 23 to isolate bits [25:17] as the
 * low 9 bits of the return value.
 *
 *     ldr r0, [r0, #0xc]
 *     mov r0, r0, lsl #0x6
 *     mov r0, r0, lsr #0x17
 *     bx  lr
 */

unsigned int func_ov000_021abe54(void *p) {
    return (*(unsigned int *)((char *)p + 0xc) << 6) >> 23;
}
