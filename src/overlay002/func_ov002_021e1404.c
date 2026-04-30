/* func_ov002_021e1404: thunk — tail-call func_ov002_021e105c with r3=0x1.
 *
 *     ldr ip, =
 *     mov r3, #0x1
 *     bx  ip
 */

extern int func_ov002_021e105c(int a, int b, int c, int d);

int func_ov002_021e1404(int a, int b, int c, int _unused) {
    return func_ov002_021e105c(a, b, c, 0x1);
}
