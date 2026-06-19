/* func_ov002_021ae3a4: tail-call into func_ov002_0229acd0 with
 * 3 fixed constants + arg.
 *
 *     ldr ip, .L_021ae49c
 *     mov r2, r0
 *     mov r0, #0x31
 *     mov r1, #0x1
 *     mov r3, #0x0
 *     bx  ip
 */

extern int func_ov002_0229acd0(int a, int b, int c, int d);

int func_ov002_021ae3a4(int x) {
    return func_ov002_0229acd0(0x31, 1, x, 0);
}
