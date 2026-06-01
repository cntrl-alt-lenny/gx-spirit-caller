/* func_ov011_021cf0a4: returns whether the 2-bit field at bits 19:18 of
 * +0x2ac is NOT 1.
 *
 *     ldr   r0, =data_ov011_021d4000
 *     ldr   r0, [r0, #0x2ac]
 *     mov   r0, r0, lsl #0xc
 *     mov   r0, r0, lsr #0x1e          ; (x >> 18) & 3
 *     cmp   r0, #0x1
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx    lr
 */

extern char data_ov011_021d4000[];

int func_ov011_021cf0a4(void) {
    return ((*(unsigned int *)(data_ov011_021d4000 + 0x2ac) << 12) >> 30) != 1;
}
