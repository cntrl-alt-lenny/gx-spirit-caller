/* func_ov002_021bbb78: thunk — tail-call func_ov002_021bbae0 with r2=~0x0.
 *
 *     ldr ip, =
 *     mvn r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021bbae0(int a, int b, int c, int d);

int func_ov002_021bbb78(int a, int b, int _unused2, int d) {
    return func_ov002_021bbae0(a, b, ~0x0, d);
}
