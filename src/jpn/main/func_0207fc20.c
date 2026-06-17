/* func_0207fc20: guarded follow-up call. If func_0207e828(p)
 * returns 0, return that value (predicated `ldmeqia`). Else
 * call func_0207fcbc(p).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207e828
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *     mov   r0, r4
 *     bl    func_0207fcbc
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207e828(void *p);
extern int func_0207fcbc(void *p);

int func_0207fc20(void *p) {
    int r = func_0207e828(p);
    if (r == 0) return r;
    return func_0207fcbc(p);
}
