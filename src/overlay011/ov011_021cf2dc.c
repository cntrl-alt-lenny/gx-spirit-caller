/* func_ov011_021cf2dc: test byte at bits 21..28 of state[0x2b0] is zero.
 * Returns 1 if that 8-bit field is zero, else 0.
 *
 *     ldr  r0, .L_021cf2f8
 *     ldr  r0, [r0, #0x2b0]
 *     mov  r0, r0, lsl #0x3        ; shift 3 left
 *     movs r0, r0, lsr #0x18       ; then 24 right (flags set)
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx   lr
 *
 * (x << 3) >> 24 extracts bits 21..28 unsigned. `movs` sets flags so
 * the subsequent cmp-free equality test works. The classic "is-zero?
 * return bool" shape with an extracted field.
 */

extern char data_ov011_021d4000[];

int func_ov011_021cf2dc(void) {
    int v = *(int *)(data_ov011_021d4000 + 0x2b0);
    return (((unsigned int)(v << 3) >> 24) == 0);
}
