/* func_02064490: store hi-byte of r2 at p[r1], lo-byte at p[r1+1].
 *
 *     mov  r3, r2, asr #0x8
 *     strb r3, [r0, r1]
 *     add  r1, r1, #0x1
 *     strb r2, [r0, r1]
 *     bx   lr
 *
 * Stores a 16-bit value as two consecutive bytes (hi first, then lo)
 * — big-endian halfword store via byte stores. asr ensures sign
 * extension when r2 is signed.
 */

void func_02064490(char *p, int idx, int hw) {
    p[idx]     = (char)(hw >> 8);
    p[idx + 1] = (char)hw;
}
