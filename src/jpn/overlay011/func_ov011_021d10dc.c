/* func_ov011_021d10dc: bitfield write — clear bit 7 of row[idx].f_18,
 * OR-in bit 7 from arg1's bit 0 (val & 1) shifted left 7.
 *
 *     ldr   r3, .L_021d11c4
 *     mov   r2, #0x28
 *     mla   r3, r0, r2, r3
 *     ldr   r2, [r3, #0x18]
 *     mov   r0, r1, lsl #0x1f          ; (val << 31)
 *     bic   r1, r2, #0x80              ; clear bit 7
 *     orr   r0, r1, r0, lsr #0x18      ; merge | (val<<31>>24)
 *     str   r0, [r3, #0x18]
 *     bx    lr
 */

extern char data_ov011_021d4580[];

void func_ov011_021d10dc(int idx, unsigned int val) {
    unsigned int *p = (unsigned int *)(data_ov011_021d4580 + idx * 0x28 + 0x18);
    *p = (*p & ~0x80u) | ((val << 31) >> 24);
}
