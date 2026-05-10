/* func_0204f778: bool-not. Returns `func_020498f0(x) == 0`.
 * sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_020498f0
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_020498f0(int x);

int func_0204f778(int x) {
    return func_020498f0(x) == 0;
}
