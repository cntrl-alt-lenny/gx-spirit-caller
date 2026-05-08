/* func_0207fd48: 2-call helper, both with same arg.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207e830
 *     mov   r0, r4
 *     bl    func_0207fda4
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207e830(int x);
extern int func_0207fda4(int x);

int func_0207fd48(int x) {
    func_0207e830(x);
    return func_0207fda4(x);
}
