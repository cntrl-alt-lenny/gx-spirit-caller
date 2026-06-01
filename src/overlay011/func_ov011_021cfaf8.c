/* func_ov011_021cfaf8: write the 4-bit field at bits 12:9 of +0x2b0 from the
 * low nibble of v, then re-clear the high blend bits (& 0xffe01fff).
 *
 *     ldr   r1, =data_ov011_021d4000
 *     mov   r2, r0, lsl #0x1c
 *     ldr   r3, [r1, #0x2b0]
 *     ldr   r0, =0xffe01fff
 *     bic   r3, r3, #0x1e00
 *     orr   r2, r3, r2, lsr #0x13          ; | ((v & 0xf) << 9)
 *     and   r0, r2, r0
 *     str   r0, [r1, #0x2b0]
 *     bx    lr
 */

extern char data_ov011_021d4000[];

void func_ov011_021cfaf8(int v) {
    *(int *)(data_ov011_021d4000 + 0x2b0) =
        ((*(int *)(data_ov011_021d4000 + 0x2b0) & ~0x1e00) | (((unsigned)v << 28) >> 19)) & 0xffe01fff;
}
