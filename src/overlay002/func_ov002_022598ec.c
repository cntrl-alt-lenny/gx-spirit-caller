/* func_ov002_022598ec: pack 3 inputs into r0 then tail-call. r0 has the
 * "sign" bit (a&1)<<31, OR'd with 0x500000, OR'd with b's low halfword.
 * mwcc default for tail-call is `ldr ip; bx ip` (C-16 W-H pattern).
 *
 *     mov   r0, r0, lsl #0x1f
 *     and   r2, r0, #0x80000000
 *     mov   r0, r1, lsl #0x10
 *     orr   r3, r2, #0x500000
 *     mov   r1, #0x0
 *     ldr   ip, .L_02259910            ; func_ov002_021fd81c
 *     mov   r2, r1
 *     orr   r0, r3, r0, lsr #0x10
 *     bx    ip
 */

extern int func_ov002_021fd81c(unsigned int packed, int b, int c);

int func_ov002_022598ec(int a, unsigned int b) {
    unsigned int packed = (((unsigned int)a << 31) & 0x80000000u) | 0x500000u | (b & 0xffffu);
    return func_ov002_021fd81c(packed, 0, 0);
}
