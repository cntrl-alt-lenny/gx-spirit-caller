/* func_ov002_021afb74: return data_ov002_022cdc88 + 4 * data_ov002_022cdc78[2].
 *
 *     ldr r0, .L_021afb88    ; data_ov002_022cdc78
 *     ldr r1, .L_021afb8c    ; data_ov002_022cdc88
 *     ldr r0, [r0, #0x8]
 *     add r0, r1, r0, lsl #0x2
 *     bx  lr
 */

extern int data_ov002_022cdc78[];
extern int data_ov002_022cdc88[];

int *func_ov002_021afb74(void) {
    return &data_ov002_022cdc88[data_ov002_022cdc78[2]];
}
