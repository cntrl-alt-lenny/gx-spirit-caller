/* func_ov000_021aa4b4: writes r0 to the bss global data_ov000_021c73e0.
 *
 *     ldr r1, =data_ov000_021c73e0
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

extern int data_ov000_021c73e0;

void func_ov000_021aa4b4(int v) {
    data_ov000_021c73e0 = v;
}
