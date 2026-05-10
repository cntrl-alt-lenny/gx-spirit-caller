/* func_ov011_021cc7f8: guarded 2-call sequence. Returns 0 if
 * guard fails; otherwise calls both helpers and returns last.
 * Style B with predicated `ldmeqia` early-out.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov011_021cdb7c
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_ov011_021cc7dc
 *     bl    func_020139fc
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov011_021cdb7c(void);
extern int func_ov011_021cc7dc(void);
extern int func_020139fc(void);

int func_ov011_021cc7f8(void) {
    int r = func_ov011_021cdb7c();
    if (r == 0) return r;
    func_ov011_021cc7dc();
    return func_020139fc();
}
