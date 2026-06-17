/* func_02036248: null-guarded 2-call helper. Style B with
 * predicated `ldmeqia` early-return.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_020361fc
 *     bl    func_02036260
 *     ldmia sp!, {r3, pc}
 */

extern int func_020361fc(int x);
extern int func_02036260(void);

int func_02036248(int x) {
    if (x == 0) return x;
    func_020361fc(x);
    return func_02036260();
}
