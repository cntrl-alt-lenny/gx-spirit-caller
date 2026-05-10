/* func_0203269c: 2-call composition. Calls func_0203268c(a),
 * passes its result as arg0 to func_02032e38, with b/c
 * preserved across the first call via r4/r5.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r1
 *     mov   r4, r2
 *     bl    func_0203268c
 *     mov   r1, r5
 *     mov   r2, r4
 *     bl    func_02032e38
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern int func_0203268c(int a);
extern int func_02032e38(int x, int b, int c);

int func_0203269c(int a, int b, int c) {
    return func_02032e38(func_0203268c(a), b, c);
}
