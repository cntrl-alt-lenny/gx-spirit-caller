/* func_0208e318: pack 4 byte-args into one 32-bit word and store at *r0.
 * 4th arg arrives via stack at sp+0; bytes arrive in r1, r2, r3, [sp].
 *
 *     ldr ip, [sp, #0x0]
 *     orr r1, r1, #0x40                   ; r1 = a | 0x40
 *     orr r2, r1, r2, lsl #0x8            ; r2 = (a|0x40) | (b<<8)
 *     orr r1, r3, ip, lsl #0x8            ; r1 = c | (d<<8)
 *     orr r1, r2, r1, lsl #0x10           ; r1 = (a|0x40) | (b<<8) | (c<<16) | (d<<24)
 *     str r1, [r0, #0x0]
 *     bx  lr
 *
 * mwcc's emit for the 4-byte-pack pattern with one byte OR'd with 0x40.
 */

void func_0208e318(int *out, int a, int b, int c, int d) {
    *out = (a | 0x40) | (b << 8) | ((c | (d << 8)) << 16);
}
