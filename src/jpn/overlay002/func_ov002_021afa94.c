/* func_ov002_021afa94: return data_ov002_022cdba8 + 4 * data_ov002_022cdb98[2].
 *
 *     ldr r0, .L_021afb88    ; data_ov002_022cdb98
 *     ldr r1, .L_021afb8c    ; data_ov002_022cdba8
 *     ldr r0, [r0, #0x8]
 *     add r0, r1, r0, lsl #0x2
 *     bx  lr
 */

extern int data_ov002_022cdb98[];
extern int data_ov002_022cdba8[];

int *func_ov002_021afa94(void) {
    return &data_ov002_022cdba8[data_ov002_022cdb98[2]];
}
