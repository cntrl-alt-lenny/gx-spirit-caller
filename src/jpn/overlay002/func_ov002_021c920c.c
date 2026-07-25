/* func_ov002_021c920c: thunk — tail-call func_ov002_021c8d58 with r2=0x0.
 *
 *     ldr ip, =
 *     mov r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021c8d58(int a, int b, int c, int d);

int func_ov002_021c920c(int a, int b, int _unused, int d) {
    return func_ov002_021c8d58(a, b, 0x0, d);
}
