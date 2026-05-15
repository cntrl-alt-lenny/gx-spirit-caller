/* func_0209bf00: 2-call composition. func_02090840(p) (discard);
 * return func_0209c0e8(p, 1). Style A epilogue → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02090840
 *     mov   r0, r4
 *     mov   r1, #0x1
 *     bl    func_0209c0e8
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_02090840(void *p);
extern int func_0209c0e8(void *p, int x);

int func_0209bf00(void *p) {
    func_02090840(p);
    return func_0209c0e8(p, 1);
}
