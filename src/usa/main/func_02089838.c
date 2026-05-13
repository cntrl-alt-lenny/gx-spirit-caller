/* func_02089838: 2-call helper — calls func_0208977c(p) then
 * func_0207da0c(*p). Style B with r4-spill (preserve p across
 * first call to deref afterwards).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0208977c
 *     ldr   r0, [r4, #0x0]
 *     bl    func_0207da0c
 *     ldmia sp!, {r4, pc}
 */

extern int func_0208977c(void *p);
extern int func_0207da0c(int x);

int func_02089838(int *p) {
    func_0208977c(p);
    return func_0207da0c(*p);
}
