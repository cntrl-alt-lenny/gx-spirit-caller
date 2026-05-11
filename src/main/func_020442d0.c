/* func_020442d0: byte-scan; return 1 if any of the first 32 bytes is
 * non-zero, else 0. Flat (no stack), signed-int loop counter.
 *
 *     mov   r2, #0x0
 *  .L_020442d4:
 *     ldrb  r1, [r0, r2]
 *     cmp   r1, #0x0
 *     movne r0, #0x1
 *     bxne  lr
 *     add   r2, r2, #0x1
 *     cmp   r2, #0x20
 *     blt   .L_020442d4
 *     mov   r0, #0x0
 *     bx    lr
 */

int func_020442d0(const unsigned char *buf) {
    int i;
    for (i = 0; i < 32; i++) {
        if (buf[i] != 0) return 1;
    }
    return 0;
}
