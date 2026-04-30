/* func_ov002_021d45cc: thunk — tail-call func_ov002_021d40b0 with r0=0x1.
 *
 *     ldr ip, =
 *     mov r0, #0x1
 *     bx  ip
 */

extern int func_ov002_021d40b0(int a, int b, int c, int d);

int func_ov002_021d45cc(int _unused, int b, int c, int d) {
    return func_ov002_021d40b0(0x1, b, c, d);
}
