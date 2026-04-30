/* func_ov002_021d1230: thunk — tail-call func_ov002_021d1158 with r0=0x4.
 *
 *     ldr ip, =
 *     mov r0, #0x4
 *     bx  ip
 */

extern int func_ov002_021d1158(int a, int b, int c, int d);

int func_ov002_021d1230(int _unused, int b, int c, int d) {
    return func_ov002_021d1158(0x4, b, c, d);
}
