/* func_ov002_022a50bc: zero-out leaf — *(int *)(data + 4) = 0.
 *
 *     ldr r0, .L_022a51dc
 *     mov r1, #0x0
 *     str r1, [r0, #0x4]
 *     bx  lr
 *  .L_022a51dc: .word data_ov002_022d1a18
 */

extern char data_ov002_022d1a18[];

void func_ov002_022a50bc(void) {
    *(int *)(data_ov002_022d1a18 + 0x4) = 0;
}
