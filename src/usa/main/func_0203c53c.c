/* func_0203c53c: deref + null-guarded tail call.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, [r0, #0x0]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_0203c41c
 *     ldmia sp!, {r3, pc}
 */

extern int func_0203c41c(void *p);

int func_0203c53c(void **p) {
    void *t = *p;
    if (t == 0) return (int)t;
    return func_0203c41c(t);
}
