/* func_ov002_021d44ec: thunk — tail-call func_ov002_021d3fc0 with r0=0x0.
 *
 *     ldr ip, =
 *     mov r0, #0x0
 *     bx  ip
 */

extern int func_ov002_021d3fc0(int a, int b, int c, int d);

int func_ov002_021d44ec(int _unused, int b, int c, int d) {
    return func_ov002_021d3fc0(0x0, b, c, d);
}
