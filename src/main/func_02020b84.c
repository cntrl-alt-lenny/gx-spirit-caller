/* func_02020b84: try-then-default helper. If first call returns
 * non-zero, return it; otherwise return func_0201f138(0xa).
 * Uses C-11 form (predicated `ldmneia` for the early non-zero
 * return).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02020248
 *     cmp   r0, #0x0
 *     ldmneia sp!, {r3, pc}
 *     mov   r0, #0xa
 *     bl    func_0201f138
 *     ldmia sp!, {r3, pc}
 */

extern int func_02020248(void);
extern int func_0201f138(int x);

int func_02020b84(void) {
    int r = func_02020248();
    if (r != 0) return r;
    return func_0201f138(0xa);
}
