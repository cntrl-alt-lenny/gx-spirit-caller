/* func_ov002_021bb90c: thunk — tail-call func_ov002_021bb7f8 with r2=~0x0.
 *
 *     ldr ip, =
 *     mvn r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021bb7f8(int a, int b, int c, int d);

int func_ov002_021bb90c(int a, int b, int _unused2, int d) {
    return func_ov002_021bb7f8(a, b, ~0x0, d);
}
