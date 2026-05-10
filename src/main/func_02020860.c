/* func_02020860: predicated-bypass + 2-call. If p->h_2 != 8,
 * return h_2 (predicated `ldmneia`). Else call f1(9) and
 * return f2().
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x8
 *     ldmneia sp!, {r3, pc}
 *     mov   r0, #0x9
 *     bl    func_0201f138
 *     bl    func_02093bfc
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201f138(int x);
extern int func_02093bfc(void);

int func_02020860(unsigned short *p) {
    int v = p[1];
    if (v != 8) return v;
    func_0201f138(9);
    return func_02093bfc();
}
