/* func_ov002_0226b3f0: u16 getter at data_ov002_022d0e6c[0xb2].
 *
 *     ldr  r0, .L_0226b3fc
 *     ldrh r0, [r0, #0xb2]
 *     bx   lr
 *   .L_0226b3fc: .word data_ov002_022d0e6c
 */

extern char data_ov002_022d0e6c[];

unsigned short func_ov002_0226b3f0(void) {
    return *(unsigned short *)(data_ov002_022d0e6c + 0xb2);
}
