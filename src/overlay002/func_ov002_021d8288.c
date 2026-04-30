/* func_ov002_021d8288: thunk — tail-call func_ov002_021d8298 with r2=0x1.
 *
 *     ldr ip, =
 *     mov r2, #0x1
 *     bx  ip
 */

extern int func_ov002_021d8298(int a, int b, int c, int d);

int func_ov002_021d8288(int a, int b, int _unused, int d) {
    return func_ov002_021d8298(a, b, 0x1, d);
}
