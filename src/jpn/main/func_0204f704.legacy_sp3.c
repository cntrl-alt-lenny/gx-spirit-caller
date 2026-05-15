/* func_0204f704: bool-not. Returns `func_0204987c(x) == 0`.
 * sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0204987c
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_0204987c(int x);

int func_0204f704(int x) {
    return func_0204987c(x) == 0;
}
