/* func_ov002_021e1304: thunk — tail-call func_ov002_021e0f6c with r3=0x0.
 *
 *     ldr ip, =
 *     mov r3, #0x0
 *     bx  ip
 */

extern int func_ov002_021e0f6c(int a, int b, int c, int d);

int func_ov002_021e1304(int a, int b, int c, int _unused) {
    return func_ov002_021e0f6c(a, b, c, 0x0);
}
