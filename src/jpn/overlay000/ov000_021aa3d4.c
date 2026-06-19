/* func_ov000_021aa3d4: writes r0 to the bss global data_ov000_021c7300.
 *
 *     ldr r1, =data_ov000_021c7300
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

extern int data_ov000_021c7300;

void func_ov000_021aa3d4(int v) {
    data_ov000_021c7300 = v;
}
