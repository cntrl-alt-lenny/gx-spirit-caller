/* func_ov002_021e1314: thunk — tail-call func_ov002_021e0f6c with r3=0x1.
 *
 *     ldr ip, =
 *     mov r3, #0x1
 *     bx  ip
 */

extern int func_ov002_021e0f6c(int a, int b, int c, int d);

int func_ov002_021e1314(int a, int b, int c, int _unused) {
    return func_ov002_021e0f6c(a, b, c, 0x1);
}
