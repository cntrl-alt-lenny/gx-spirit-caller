/* func_ov000_021af368: writes r0 into bss at data_ov000_021c758c + 0x2a0.
 *
 *     ldr r1, =data_ov000_021c758c
 *     str r0, [r1, #0x2a0]
 *     bx  lr
 */

extern char data_ov000_021c758c[];

void func_ov000_021af368(int v) {
    *(int *)(data_ov000_021c758c + 0x2a0) = v;
}
