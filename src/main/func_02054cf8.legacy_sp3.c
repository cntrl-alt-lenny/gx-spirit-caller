/* func_02054cf8: chain func_0206ed54() result into
 * func_02054ea8(?, -1). sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0206ed54
 *     mvn   r1, #0x0                     ; r1 = -1
 *     bl    func_02054ea8
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_0206ed54(void);
extern int func_02054ea8(int x, int y);

int func_02054cf8(void) {
    return func_02054ea8(func_0206ed54(), -1);
}
