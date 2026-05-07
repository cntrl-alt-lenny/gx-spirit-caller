/* func_02087328: clear bit `arg` in `data_021a4854`.
 *
 *     ldr r1, .L_02087344
 *     mov r2, #0x1
 *     mvn r0, r2, lsl r0       ; r0 = ~(1 << arg)
 *     ldr r2, [r1, #0x0]
 *     and r0, r2, r0
 *     str r0, [r1, #0x0]
 *     bx  lr
 *  .L_02087344: .word data_021a4854
 */

extern unsigned int data_021a4854;

void func_02087328(int bit) {
    data_021a4854 &= ~(1u << bit);
}
