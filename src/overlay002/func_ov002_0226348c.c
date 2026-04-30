/* func_ov002_0226348c: thunk — tail-call func_ov002_022630b0 with r1=0x19c0.
 *
 *     ldr ip, =
 *     mov r1, #0x19c0
 *     bx  ip
 */

extern int func_ov002_022630b0(int a, int b, int c, int d);

int func_ov002_0226348c(int a, int _unused, int c, int d) {
    return func_ov002_022630b0(a, 0x19c0, c, d);
}
