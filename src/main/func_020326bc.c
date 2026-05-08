/* func_020326bc: 2-call helper — calls func_0203268c(a), then
 * returns func_02032e6c(b). Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r1
 *     bl    func_0203268c
 *     mov   r1, r4
 *     bl    func_02032e6c
 *     ldmia sp!, {r4, pc}
 */

extern int func_0203268c(int a);
extern int func_02032e6c(int x, int b);

int func_020326bc(int a, int b) {
    return func_02032e6c(func_0203268c(a), b);
}
