/* func_ov000_021af26c: writes r0 into bss at data_ov000_021c74ac + 0x1a4.
 *
 *     ldr r1, =data_ov000_021c74ac
 *     str r0, [r1, #0x1a4]
 *     bx  lr
 */

extern char data_ov000_021c74ac[];

void func_ov000_021af26c(int v) {
    *(int *)(data_ov000_021c74ac + 0x1a4) = v;
}
