/* func_ov002_021c92ec: thunk — tail-call func_ov002_021c8e38 with r2=0x0.
 *
 *     ldr ip, =
 *     mov r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021c8e38(int a, int b, int c, int d);

int func_ov002_021c92ec(int a, int b, int _unused, int d) {
    return func_ov002_021c8e38(a, b, 0x0, d);
}
