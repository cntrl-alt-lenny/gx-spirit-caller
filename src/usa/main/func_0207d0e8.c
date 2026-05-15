/* func_0207d0e8: 2-call composition. Result of first call (in r0)
 * + arg-preserved-via-r4-as-r1 → second call.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207d18c
 *     mov   r1, r4
 *     bl    func_0207cf0c
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207d18c(int a);
extern int func_0207cf0c(int a, int b);

int func_0207d0e8(int x) {
    return func_0207cf0c(func_0207d18c(x), x);
}
