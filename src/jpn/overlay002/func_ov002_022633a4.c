/* func_ov002_022633a4: thunk — tail-call func_ov002_02262fc8 with r1=0x19c0.
 *
 *     ldr ip, =
 *     mov r1, #0x19c0
 *     bx  ip
 */

extern int func_ov002_02262fc8(int a, int b, int c, int d);

int func_ov002_022633a4(int a, int _unused, int c, int d) {
    return func_ov002_02262fc8(a, 0x19c0, c, d);
}
