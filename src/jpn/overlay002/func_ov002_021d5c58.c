/* func_ov002_021d5c58: thunk — tail-call func_ov002_021d5c68 with r3=0xa.
 *
 *     ldr ip, =
 *     mov r3, #0xa
 *     bx  ip
 */

extern int func_ov002_021d5c68(int a, int b, int c, int d);

int func_ov002_021d5c58(int a, int b, int c, int _unused) {
    return func_ov002_021d5c68(a, b, c, 0xa);
}
