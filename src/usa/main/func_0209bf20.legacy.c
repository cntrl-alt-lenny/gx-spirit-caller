/* func_0209bf20: similar shape to func_0209bf00 — calls
 * func_0209c18c(p, 1) (return discarded), then
 * func_0209085c(p). Style A.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     mov   r1, #0x1
 *     bl    func_0209c18c
 *     mov   r0, r4
 *     bl    func_0209085c
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_0209c18c(void *p, int x);
extern int func_0209085c(void *p);

int func_0209bf20(void *p) {
    func_0209c18c(p, 1);
    return func_0209085c(p);
}
