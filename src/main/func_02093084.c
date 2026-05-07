/* func_02093084: set bit `arg` in halfword at `data_021a66bc`.
 *
 *     ldr  r1, .L_0209309c
 *     mov  r2, #0x1
 *     ldrh r3, [r1, #0x0]
 *     orr  r0, r3, r2, lsl r0     ; r0 = old | (1 << arg)
 *     strh r0, [r1, #0x0]
 *     bx   lr
 *  .L_0209309c: .word data_021a66bc
 */

extern unsigned short data_021a66bc;

void func_02093084(int bit) {
    data_021a66bc |= (1u << bit);
}
