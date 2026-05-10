/* func_ov002_021ae5f0: tail-call func_ov002_0229ade0(0x31, 5, x, y).
 *
 *     ldr ip, .L_021ae608
 *     mov r2, r0
 *     mov r3, r1
 *     mov r0, #0x31
 *     mov r1, #0x5
 *     bx  ip
 */

extern int func_ov002_0229ade0(int a, int b, int c, int d);

int func_ov002_021ae5f0(int x, int y) {
    return func_ov002_0229ade0(0x31, 5, x, y);
}
