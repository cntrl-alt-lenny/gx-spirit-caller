/* func_ov000_021ac7a8: returns 1 iff bits 4..6 of `*r0` equal 1.
 *
 *     ldr r0, [r0, #0x0]
 *     mov r0, r0, lsl #0x19    ; lsl 25 → keep bits 0..6, place at 25..31
 *     mov r0, r0, lsr #0x1c    ; lsr 28 → bits 4..6 of original at low
 *     cmp r0, #0x1
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 *
 * Bitfield extract via `(x << 25) >> 28` = `(x >> 3) & 0xf`... wait
 * actually `(x << 25) >> 28` extracts bits 4..6 (3 bits) as unsigned.
 */

int func_ov000_021ac7a8(unsigned int *p) {
    return (((*p) << 25) >> 28) == 1;
}
