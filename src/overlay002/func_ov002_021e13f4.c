/* func_ov002_021e13f4: thunk — tail-call func_ov002_021e105c with r3=0x0.
 *
 *     ldr ip, =
 *     mov r3, #0x0
 *     bx  ip
 */

extern int func_ov002_021e105c(int a, int b, int c, int d);

int func_ov002_021e13f4(int a, int b, int c, int _unused) {
    return func_ov002_021e105c(a, b, c, 0x0);
}
