/* func_ov002_021bbd04: thunk — tail-call func_ov002_021bbc68 with r2=~0x0.
 *
 *     ldr ip, =
 *     mvn r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021bbc68(int a, int b, int c, int d);

int func_ov002_021bbd04(int a, int b, int _unused2, int d) {
    return func_ov002_021bbc68(a, b, ~0x0, d);
}
