/* func_02032648: 2-call composition. Calls func_02032638(a),
 * passes its result as arg0 to func_02032de4, with b/c
 * preserved across the first call via r4/r5.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r1
 *     mov   r4, r2
 *     bl    func_02032638
 *     mov   r1, r5
 *     mov   r2, r4
 *     bl    func_02032de4
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern int func_02032638(int a);
extern int func_02032de4(int x, int b, int c);

int func_02032648(int a, int b, int c) {
    return func_02032de4(func_02032638(a), b, c);
}
