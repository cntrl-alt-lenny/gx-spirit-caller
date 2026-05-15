/* func_02032668: 2-call helper — calls func_02032638(a), then
 * returns func_02032e18(b). Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r1
 *     bl    func_02032638
 *     mov   r1, r4
 *     bl    func_02032e18
 *     ldmia sp!, {r4, pc}
 */

extern int func_02032638(int a);
extern int func_02032e18(int x, int b);

int func_02032668(int a, int b) {
    return func_02032e18(func_02032638(a), b);
}
