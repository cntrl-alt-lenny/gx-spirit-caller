/* func_ov011_021d0f94: bitfield write — clear bits 2..9 of row[idx].f_8
 * and OR-in val's low byte shifted left 2. The trailing `& 0x3fcu` mask
 * is redundant (shifts already isolate the bits) and removing it lets
 * mwcc fuse the lsr into the orr's shifted-operand form.
 *
 *     ldr   r3, .L_021d107c
 *     mov   r2, #0x28
 *     mla   r3, r0, r2, r3
 *     ldr   r2, [r3, #0x8]
 *     mov   r0, r1, lsl #0x18
 *     bic   r1, r2, #0x3fc
 *     orr   r0, r1, r0, lsr #0x16
 *     str   r0, [r3, #0x8]
 *     bx    lr
 */

extern char data_ov011_021d4580[];

void func_ov011_021d0f94(int idx, unsigned int val) {
    unsigned int *p = (unsigned int *)(data_ov011_021d4580 + idx * 0x28 + 0x8);
    *p = (*p & ~0x3fcu) | ((val << 24) >> 22);
}
