/* func_ov002_021afe98: signed-shift high byte of u16 array element.
 *
 *     ldr  r1, .L_021aff8c
 *     mov  r0, r0, lsl #0x1
 *     ldrh r0, [r1, r0]
 *     mov  r0, r0, asr #0x8     ; signed shift (asr = signed >>)
 *     bx   lr
 *  .L_021aff8c: .word data_ov002_022cdfa8
 */

extern unsigned short data_ov002_022cdfa8[];

int func_ov002_021afe98(int idx) {
    return (int)data_ov002_022cdfa8[idx] >> 8;
}
