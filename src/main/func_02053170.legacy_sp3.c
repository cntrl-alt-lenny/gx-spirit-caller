/* func_02053170: returns 1 if func_02053688() != 0 else 0.
 * sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_02053688
 *     cmp   r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_02053688(void);

int func_02053170(void) {
    return func_02053688() != 0 ? 1 : 0;
}
