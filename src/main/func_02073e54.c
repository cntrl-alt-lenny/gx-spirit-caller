/* func_02073e54: returns 1 iff top nibble of arg equals 0xe.
 *
 *     and r0, r0, #0xf0000000
 *     cmp r0, #0xe0000000
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

int func_02073e54(unsigned int arg) {
    return (arg & 0xf0000000u) == 0xe0000000u;
}
