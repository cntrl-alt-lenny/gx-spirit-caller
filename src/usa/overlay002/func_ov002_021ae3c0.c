/* func_ov002_021ae3c0: tail-call func_ov002_0229acd0(0x31, 2, x, y).
 *
 *     ldr ip, .L_021ae4b8
 *     mov r2, r0
 *     mov r3, r1
 *     mov r0, #0x31
 *     mov r1, #0x2
 *     bx  ip
 */

extern int func_ov002_0229acd0(int a, int b, int c, int d);

int func_ov002_021ae3c0(int x, int y) {
    return func_ov002_0229acd0(0x31, 2, x, y);
}
