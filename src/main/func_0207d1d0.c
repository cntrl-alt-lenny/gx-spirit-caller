/* func_0207d1d0: 2-call composition. Result of first call (in r0)
 * + arg-preserved-via-r4-as-r1 → second call.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207d274
 *     mov   r1, r4
 *     bl    func_0207cff4
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207d274(int a);
extern int func_0207cff4(int a, int b);

int func_0207d1d0(int x) {
    return func_0207cff4(func_0207d274(x), x);
}
