/* func_ov000_021af358: writes r0 into bss at data_ov000_021c758c + 0x1a4.
 *
 *     ldr r1, =data_ov000_021c758c
 *     str r0, [r1, #0x1a4]
 *     bx  lr
 */

extern char data_ov000_021c758c[];

void func_ov000_021af358(int v) {
    *(int *)(data_ov000_021c758c + 0x1a4) = v;
}
