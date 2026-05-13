/* func_02089acc: arg-shuffle + 2-call composition.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r1, r2                       ; r1 = arg2
 *     mov   r4, r0                       ; save arg0
 *     mov   r2, r3                       ; r2 = arg3
 *     bl    func_02089b8c                ; (arg0, arg2, arg3)
 *     mov   r0, r4
 *     bl    func_02095f6c                ; (arg0)
 *     ldmia sp!, {r4, pc}
 */

extern int func_02089b8c(int a, int b, int c);
extern int func_02095f6c(int x);

int func_02089acc(int a, int unused, int b, int c) {
    func_02089b8c(a, b, c);
    return func_02095f6c(a);
}
