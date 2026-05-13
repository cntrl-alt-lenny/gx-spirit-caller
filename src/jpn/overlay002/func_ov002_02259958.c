/* func_ov002_02259958: clone of func_ov002_02259804 with different
 * tail-call target (func_ov002_021e2fc4).
 *
 *     mov   r0, r0, lsl #0x1f
 *     and   r2, r0, #0x80000000
 *     mov   r0, r1, lsl #0x10
 *     orr   r3, r2, #0x500000
 *     mov   r1, #0x0
 *     ldr   ip, .L_02259a64            ; func_ov002_021e2fc4
 *     mov   r2, r1
 *     orr   r0, r3, r0, lsr #0x10
 *     bx    ip
 */

extern int func_ov002_021e2fc4(unsigned int packed, int b, int c);

int func_ov002_02259958(int a, unsigned int b) {
    unsigned int packed = (((unsigned int)a << 31) & 0x80000000u) | 0x500000u | (b & 0xffffu);
    return func_ov002_021e2fc4(packed, 0, 0);
}
