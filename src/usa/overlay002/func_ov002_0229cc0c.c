/* func_ov002_0229cc0c: thunk — `func_02034838(5, a, b, d)`. Same shape
 * as the anchor func_02045364 (`func_0204543c(5, a, 0, d)`) but
 * passes the original arg1 as `b` rather than zero, and targets a
 * different function.
 *
 *     ldr ip, .L_0229cd30
 *     mov r2, r1
 *     mov r1, r0
 *     mov r0, #0x5
 *     bx  ip
 * .L_0229cd30: .word func_02034838
 */

extern int func_02034838(int a, int b, int c, int d);

int func_ov002_0229cc0c(int a, int b, int unused, int d) {
    (void)unused;
    return func_02034838(5, a, b, d);
}
