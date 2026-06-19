/* func_ov011_021cc734: guarded 2-call sequence. Returns 0 if
 * guard fails; otherwise calls both helpers and returns last.
 * Style B with predicated `ldmeqia` early-out.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov011_021cdab8
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_ov011_021cc718
 *     bl    func_020139c8
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov011_021cdab8(void);
extern int func_ov011_021cc718(void);
extern int func_020139c8(void);

int func_ov011_021cc734(void) {
    int r = func_ov011_021cdab8();
    if (r == 0) return r;
    func_ov011_021cc718();
    return func_020139c8();
}
