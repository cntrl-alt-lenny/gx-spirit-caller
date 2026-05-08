/* func_0206be28: 2-call composition preserving arg1 across the
 * first call. Style A epilogue (`pop {r4, lr}; bx lr`) → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r1
 *     bl    func_0206bf4c
 *     mov   r1, r4
 *     bl    func_0206be64
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_0206bf4c(int a, int b);
extern int func_0206be64(int a, int b);

int func_0206be28(int a, int b) {
    return func_0206be64(func_0206bf4c(a, b), b);
}
