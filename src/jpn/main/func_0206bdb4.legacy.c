/* func_0206bdb4: 2-call composition preserving arg1 across the
 * first call. Style A epilogue (`pop {r4, lr}; bx lr`) → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r1
 *     bl    func_0206bed8
 *     mov   r1, r4
 *     bl    func_0206bdf0
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_0206bed8(int a, int b);
extern int func_0206bdf0(int a, int b);

int func_0206bdb4(int a, int b) {
    return func_0206bdf0(func_0206bed8(a, b), b);
}
