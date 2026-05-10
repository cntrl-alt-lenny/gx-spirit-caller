/* func_0209c014: similar shape to func_0209bff4 — calls
 * func_0209c280(p, 1) (return discarded), then
 * func_02090944(p). Style A.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     mov   r1, #0x1
 *     bl    func_0209c280
 *     mov   r0, r4
 *     bl    func_02090944
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_0209c280(void *p, int x);
extern int func_02090944(void *p);

int func_0209c014(void *p) {
    func_0209c280(p, 1);
    return func_02090944(p);
}
