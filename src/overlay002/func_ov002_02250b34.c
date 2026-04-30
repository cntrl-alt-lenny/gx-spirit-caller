/* func_ov002_02250b34: thunk — tail-call func_ov002_02253458 with r1=0xb.
 *
 *     ldr ip, =
 *     mov r1, #0xb
 *     bx  ip
 */

extern int func_ov002_02253458(int a, int b, int c, int d);

int func_ov002_02250b34(int a, int _unused, int c, int d) {
    return func_ov002_02253458(a, 0xb, c, d);
}
