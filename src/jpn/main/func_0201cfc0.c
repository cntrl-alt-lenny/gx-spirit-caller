/* func_0201cfc0: null-guarded call composition. Same shape as
 * brief 046 wave 7 thunks but with predicated `moveq + ldmeqia`
 * — the `moveq r0, #0` is mwcc emitting a redundant zero-set
 * before the predicated pop.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0201cf34
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_0209e35c
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201cf34(void);
extern int func_0209e35c(int x);

int func_0201cfc0(void) {
    int r = func_0201cf34();
    if (r == 0) return 0;
    return func_0209e35c(r);
}
