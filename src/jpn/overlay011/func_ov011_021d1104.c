/* func_ov011_021d1104: clone of 021d11a0; clears bit 6 instead of bit 7.
 *
 *     ldr   r3, .L_021d11ec
 *     mov   r2, #0x28
 *     mla   r3, r0, r2, r3
 *     ldr   r2, [r3, #0x18]
 *     mov   r0, r1, lsl #0x1f
 *     bic   r1, r2, #0x40
 *     orr   r0, r1, r0, lsr #0x19
 *     str   r0, [r3, #0x18]
 *     bx    lr
 */

extern char data_ov011_021d4580[];

void func_ov011_021d1104(int idx, unsigned int val) {
    unsigned int *p = (unsigned int *)(data_ov011_021d4580 + idx * 0x28 + 0x18);
    *p = (*p & ~0x40u) | ((val << 31) >> 25);
}
