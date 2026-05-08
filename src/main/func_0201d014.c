/* func_0201d014: null-guarded call composition. Same shape as
 * brief 046 wave 7 thunks but with predicated `moveq + ldmeqia`
 * — the `moveq r0, #0` is mwcc emitting a redundant zero-set
 * before the predicated pop.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0201cf88
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_0209e450
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201cf88(void);
extern int func_0209e450(int x);

int func_0201d014(void) {
    int r = func_0201cf88();
    if (r == 0) return 0;
    return func_0209e450(r);
}
