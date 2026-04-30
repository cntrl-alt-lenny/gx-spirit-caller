/* func_ov002_021d1220: thunk — tail-call func_ov002_021d1158 with r0=0x3.
 *
 *     ldr ip, =
 *     mov r0, #0x3
 *     bx  ip
 */

extern int func_ov002_021d1158(int a, int b, int c, int d);

int func_ov002_021d1220(int _unused, int b, int c, int d) {
    return func_ov002_021d1158(0x3, b, c, d);
}
