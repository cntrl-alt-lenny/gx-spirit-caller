/* func_0203c58c: deref + null-guarded tail call.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, [r0, #0x0]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_0203c46c
 *     ldmia sp!, {r3, pc}
 */

extern int func_0203c46c(void *p);

int func_0203c58c(void **p) {
    void *t = *p;
    if (t == 0) return (int)t;
    return func_0203c46c(t);
}
