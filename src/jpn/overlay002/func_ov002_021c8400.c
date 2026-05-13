/* func_ov002_021c8400: thunk — tail-call func_ov002_021c8410 with r2=0x0.
 *
 *     ldr ip, =
 *     mov r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021c8410(int a, int b, int c, int d);

int func_ov002_021c8400(int a, int b, int _unused, int d) {
    return func_ov002_021c8410(a, b, 0x0, d);
}
