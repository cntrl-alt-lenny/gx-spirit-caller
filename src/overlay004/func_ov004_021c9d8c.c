/* func_ov004_021c9d8c: setter — *(int *)(data + 0x48) = arg.
 *
 *     ldr r1, .L_021c9d98
 *     str r0, [r1, #0x48]
 *     bx  lr
 *  .L_021c9d98: .word data_ov004_0220b500
 */

extern char data_ov004_0220b500[];

void func_ov004_021c9d8c(int x) {
    *(int *)(data_ov004_0220b500 + 0x48) = x;
}
