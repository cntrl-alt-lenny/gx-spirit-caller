/* func_ov002_021d1158: thunk — tail-call func_ov002_021d1070 with r0=0x5.
 *
 *     ldr ip, =
 *     mov r0, #0x5
 *     bx  ip
 */

extern int func_ov002_021d1070(int a, int b, int c, int d);

int func_ov002_021d1158(int _unused, int b, int c, int d) {
    return func_ov002_021d1070(0x5, b, c, d);
}
