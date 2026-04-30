/* func_ov002_021ae7a8: thunk — tail-call func_ov002_0229c7f8 with r0=0x31
 * (and r1, r2, r3 passed through from caller).
 *
 *     ldr ip, .L_021ae7b4
 *     mov r0, #0x31
 *     bx  ip
 * .L_021ae7b4: .word func_ov002_0229c7f8
 */

extern int func_ov002_0229c7f8(int a, int b, int c, int d);

int func_ov002_021ae7a8(int a, int b, int c, int d) {
    return func_ov002_0229c7f8(0x31, b, c, d);
}
