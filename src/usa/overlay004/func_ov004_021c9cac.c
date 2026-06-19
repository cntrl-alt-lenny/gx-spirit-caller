/* func_ov004_021c9cac: setter — *(int *)(data + 0x48) = arg.
 *
 *     ldr r1, .L_021c9d98
 *     str r0, [r1, #0x48]
 *     bx  lr
 *  .L_021c9d98: .word data_ov004_0220b2a0
 */

extern char data_ov004_0220b2a0[];

void func_ov004_021c9cac(int x) {
    *(int *)(data_ov004_0220b2a0 + 0x48) = x;
}
