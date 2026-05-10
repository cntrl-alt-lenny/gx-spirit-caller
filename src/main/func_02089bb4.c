/* func_02089bb4: arg-shuffle + 2-call composition.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r1, r2                       ; r1 = arg2
 *     mov   r4, r0                       ; save arg0
 *     mov   r2, r3                       ; r2 = arg3
 *     bl    func_02089c74                ; (arg0, arg2, arg3)
 *     mov   r0, r4
 *     bl    func_02096060                ; (arg0)
 *     ldmia sp!, {r4, pc}
 */

extern int func_02089c74(int a, int b, int c);
extern int func_02096060(int x);

int func_02089bb4(int a, int unused, int b, int c) {
    func_02089c74(a, b, c);
    return func_02096060(a);
}
