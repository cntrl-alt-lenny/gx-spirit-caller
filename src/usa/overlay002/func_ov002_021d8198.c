/* func_ov002_021d8198: thunk — tail-call func_ov002_021d81a8 with r2=0x1.
 *
 *     ldr ip, =
 *     mov r2, #0x1
 *     bx  ip
 */

extern int func_ov002_021d81a8(int a, int b, int c, int d);

int func_ov002_021d8198(int a, int b, int _unused, int d) {
    return func_ov002_021d81a8(a, b, 0x1, d);
}
