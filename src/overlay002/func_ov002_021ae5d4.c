/* func_ov002_021ae5d4: tail-call func_ov002_0229ade0(0x31, 4, 0xe7, x).
 *
 *     ldr ip, .L_021ae5ec
 *     mov r3, r0
 *     mov r0, #0x31
 *     mov r1, #0x4
 *     mov r2, #0xe7
 *     bx  ip
 */

extern int func_ov002_0229ade0(int a, int b, int c, int d);

int func_ov002_021ae5d4(int x) {
    return func_ov002_0229ade0(0x31, 4, 0xe7, x);
}
