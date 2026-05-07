/* func_ov002_021afc54: low byte of u16 array element at index `idx`.
 *
 *     ldr  r1, .L_021afc68
 *     mov  r0, r0, lsl #0x1
 *     ldrh r0, [r1, r0]
 *     and  r0, r0, #0xff
 *     bx   lr
 *  .L_021afc68: .word data_ov002_022ce088
 */

extern unsigned short data_ov002_022ce088[];

unsigned int func_ov002_021afc54(int idx) {
    return data_ov002_022ce088[idx] & 0xff;
}
