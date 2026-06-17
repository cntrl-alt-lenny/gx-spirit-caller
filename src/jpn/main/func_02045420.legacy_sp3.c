/* func_02045420: 5-arg call with constant 5th arg (0x20) on
 * stack. sp3 signature (sub sp + 1-step pop).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     mov   ip, #0x20
 *     str   ip, [sp, #0x0]
 *     bl    func_020453ac
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_020453ac(int a, int b, int c, int d, int e);

int func_02045420(int a, int b, int c, int d) {
    return func_020453ac(a, b, c, d, 0x20);
}
