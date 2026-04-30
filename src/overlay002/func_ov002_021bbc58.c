/* func_ov002_021bbc58: thunk — tail-call func_ov002_021bbbc0 with r2=~0x0.
 *
 *     ldr ip, =
 *     mvn r2, #0x0
 *     bx  ip
 */

extern int func_ov002_021bbbc0(int a, int b, int c, int d);

int func_ov002_021bbc58(int a, int b, int _unused2, int d) {
    return func_ov002_021bbbc0(a, b, ~0x0, d);
}
