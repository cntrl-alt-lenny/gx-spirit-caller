/* func_ov002_02259a68: pack 3-input (sign-bit + halfword + halfword) +
 * tail-call. Cousin of 022598ec / 02259a40 with extra halfword arg.
 *
 *     mov   r0, r0, lsl #0x1f
 *     and   r3, r0, #0x80000000
 *     mov   r0, r1, lsl #0x10
 *     orr   r1, r3, #0x4e0000
 *     ldr   ip, .L_02259a90            ; func_ov002_021e30b4
 *     mov   r2, r2, lsl #0x10
 *     orr   r0, r1, r0, lsr #0x10
 *     mov   r1, r2, lsr #0x10
 *     mov   r2, #0x0
 *     bx    ip
 */

extern int func_ov002_021e30b4(unsigned int packed, unsigned int c, int z);

int func_ov002_02259a68(int a, unsigned int b, unsigned int c) {
    unsigned int packed = (((unsigned int)a << 31) & 0x80000000u) | 0x4e0000u | (b & 0xffffu);
    return func_ov002_021e30b4(packed, c & 0xffffu, 0);
}
