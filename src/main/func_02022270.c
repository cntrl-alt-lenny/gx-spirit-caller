/* func_02022270: signed halfword access at offset base + i*2 + 8.
 * Computes address as base + i*2, then loads signed halfword at +8.
 *
 *     add   r0, r0, r1, lsl #0x1
 *     ldrsh r0, [r0, #0x8]
 *     bx    lr
 */

int func_02022270(char *base, int i) {
    short *p = (short *)(base + i * 2);
    return p[4];   /* +8 bytes = p[4] for short* */
}
