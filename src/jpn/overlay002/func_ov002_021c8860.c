/* func_ov002_021c8860: thunk — tail-call func_ov002_021c8870 with r2=~0x0.
 *
 *     ldr ip, =
 *     mvn r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021c8870(int a, int b, int c, int d);

int func_ov002_021c8860(int a, int b, int _unused2, int d) {
    return func_ov002_021c8870(a, b, ~0x0, d);
}
