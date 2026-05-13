/* func_02062764: 2-call helper passing the same arg to both
 * (using r4 to preserve across the first call). Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_020624bc
 *     mov   r0, r4
 *     bl    func_02064a2c
 *     ldmia sp!, {r4, pc}
 */

extern int func_020624bc(int x);
extern int func_02064a2c(int x);

int func_02062764(int x) {
    func_020624bc(x);
    return func_02064a2c(x);
}
