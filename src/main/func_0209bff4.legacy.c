/* func_0209bff4: 2-call composition. func_02090928(p) (discard);
 * return func_0209c1dc(p, 1). Style A epilogue → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02090928
 *     mov   r0, r4
 *     mov   r1, #0x1
 *     bl    func_0209c1dc
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_02090928(void *p);
extern int func_0209c1dc(void *p, int x);

int func_0209bff4(void *p) {
    func_02090928(p);
    return func_0209c1dc(p, 1);
}
