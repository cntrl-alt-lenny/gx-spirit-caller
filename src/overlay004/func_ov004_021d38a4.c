/* func_ov004_021d38a4: setter — write pointer to data_ov004_0229159c.
 *
 *     ldr r1, .L_021d38b0
 *     str r0, [r1, #0x0]
 *     bx  lr
 *  .L_021d38b0: .word data_ov004_0229159c
 */

extern void *data_ov004_0229159c;

void func_ov004_021d38a4(void *p) {
    data_ov004_0229159c = p;
}
