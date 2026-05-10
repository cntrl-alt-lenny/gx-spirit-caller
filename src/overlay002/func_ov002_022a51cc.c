/* func_ov002_022a51cc: zero-out leaf — *(int *)(data + 4) = 0.
 *
 *     ldr r0, .L_022a51dc
 *     mov r1, #0x0
 *     str r1, [r0, #0x4]
 *     bx  lr
 *  .L_022a51dc: .word data_ov002_022d1af8
 */

extern char data_ov002_022d1af8[];

void func_ov002_022a51cc(void) {
    *(int *)(data_ov002_022d1af8 + 0x4) = 0;
}
