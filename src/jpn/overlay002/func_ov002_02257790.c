/* func_ov002_02257790: thunk — tail-call func_ov002_022577a0 with r2=~0x0.
 *
 *     ldr ip, =
 *     mvn r2, #0x0
 *     bx  ip
 */

extern int func_ov002_022577a0(int a, int b, int c, int d);

int func_ov002_02257790(int a, int b, int _unused2, int d) {
    return func_ov002_022577a0(a, b, ~0x0, d);
}
