/* func_ov000_021af27c: writes r0 into bss at data_ov000_021c74ac + 0x2a0.
 *
 *     ldr r1, =data_ov000_021c74ac
 *     str r0, [r1, #0x2a0]
 *     bx  lr
 */

extern char data_ov000_021c74ac[];

void func_ov000_021af27c(int v) {
    *(int *)(data_ov000_021c74ac + 0x2a0) = v;
}
