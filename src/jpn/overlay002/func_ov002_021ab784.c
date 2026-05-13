/* func_ov002_021ab784: thunk — tail-call func_ov002_021aa478 with r1=0x0.
 *
 *     ldr ip, =
 *     mov r1, #0x0
 *     bx  ip
 */

extern int func_ov002_021aa478(int a, int b, int c, int d);

int func_ov002_021ab784(int a, int _unused, int c, int d) {
    return func_ov002_021aa478(a, 0x0, c, d);
}
