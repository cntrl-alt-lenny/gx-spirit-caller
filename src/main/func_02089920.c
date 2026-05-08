/* func_02089920: 2-call helper — calls func_02089864(p) then
 * func_0207daf4(*p). Style B with r4-spill (preserve p across
 * first call to deref afterwards).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02089864
 *     ldr   r0, [r4, #0x0]
 *     bl    func_0207daf4
 *     ldmia sp!, {r4, pc}
 */

extern int func_02089864(void *p);
extern int func_0207daf4(int x);

int func_02089920(int *p) {
    func_02089864(p);
    return func_0207daf4(*p);
}
