/* func_0207fc60: 2-call helper, both with same arg.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207e748
 *     mov   r0, r4
 *     bl    func_0207fcbc
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207e748(int x);
extern int func_0207fcbc(int x);

int func_0207fc60(int x) {
    func_0207e748(x);
    return func_0207fcbc(x);
}
