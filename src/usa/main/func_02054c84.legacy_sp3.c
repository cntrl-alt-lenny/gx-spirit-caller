/* func_02054c84: chain func_0206ece0() result into
 * func_02054e34(?, -1). sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0206ece0
 *     mvn   r1, #0x0                     ; r1 = -1
 *     bl    func_02054e34
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_0206ece0(void);
extern int func_02054e34(int x, int y);

int func_02054c84(void) {
    return func_02054e34(func_0206ece0(), -1);
}
