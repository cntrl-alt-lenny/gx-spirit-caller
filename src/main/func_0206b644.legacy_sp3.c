/* func_0206b644: deref, call, deref. Returns *func_020540d0(p[1]).
 * sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r0, [r0, #0x4]
 *     bl    func_020540d0
 *     ldr   r0, [r0, #0x0]
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int *func_020540d0(int x);

int func_0206b644(int *p) {
    return *func_020540d0(p[1]);
}
