/* func_0206ba3c: call func + return bool. Style A epilogue → .legacy.c
 * (mwcc 1.2/sp2p3).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0207cb68
 *     cmp   r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern int func_0207cb68(void);

int func_0206ba3c(void) {
    return func_0207cb68() != 0;
}
