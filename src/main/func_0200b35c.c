/* func_0200b35c: byte-narrowing copy. For i in [0, n), dst[i] = (u8)src[i]
 * where src is a u32 array. Returns 1.
 *
 *     cmp   r2, #0x0
 *     mov   ip, #0x0
 *     bls   .L_0200b37c
 *  .L_0200b368:
 *     ldr   r3, [r1, ip, lsl #0x2]
 *     strb  r3, [r0, ip]
 *     add   ip, ip, #0x1
 *     cmp   ip, r2
 *     blo   .L_0200b368
 *  .L_0200b37c:
 *     mov   r0, #0x1
 *     bx    lr
 */

int func_0200b35c(unsigned char *dst, const unsigned int *src, unsigned int n) {
    unsigned int i;
    for (i = 0; i < n; i++) {
        dst[i] = (unsigned char)src[i];
    }
    return 1;
}
