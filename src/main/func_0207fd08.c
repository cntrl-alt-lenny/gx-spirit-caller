/* func_0207fd08: guarded follow-up call. If func_0207e910(p)
 * returns 0, return that value (predicated `ldmeqia`). Else
 * call func_0207fda4(p).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207e910
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *     mov   r0, r4
 *     bl    func_0207fda4
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207e910(void *p);
extern int func_0207fda4(void *p);

int func_0207fd08(void *p) {
    int r = func_0207e910(p);
    if (r == 0) return r;
    return func_0207fda4(p);
}
