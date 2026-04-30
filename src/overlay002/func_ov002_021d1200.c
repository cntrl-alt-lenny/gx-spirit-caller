/* func_ov002_021d1200: thunk — tail-call func_ov002_021d1158 with r0=0x1.
 *
 *     ldr ip, =
 *     mov r0, #0x1
 *     bx  ip
 */

extern int func_ov002_021d1158(int a, int b, int c, int d);

int func_ov002_021d1200(int _unused, int b, int c, int d) {
    return func_ov002_021d1158(0x1, b, c, d);
}
