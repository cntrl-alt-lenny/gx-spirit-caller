/* func_0206b5d0: deref, call, deref. Returns *func_0205405c(p[1]).
 * sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r0, [r0, #0x4]
 *     bl    func_0205405c
 *     ldr   r0, [r0, #0x0]
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int *func_0205405c(int x);

int func_0206b5d0(int *p) {
    return *func_0205405c(p[1]);
}
