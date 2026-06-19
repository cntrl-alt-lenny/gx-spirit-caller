/* func_ov002_0226b300: u16 getter at data_ov002_022d0d8c[0xb2].
 *
 *     ldr  r0, .L_0226b3fc
 *     ldrh r0, [r0, #0xb2]
 *     bx   lr
 *   .L_0226b3fc: .word data_ov002_022d0d8c
 */

extern char data_ov002_022d0d8c[];

unsigned short func_ov002_0226b300(void) {
    return *(unsigned short *)(data_ov002_022d0d8c + 0xb2);
}
