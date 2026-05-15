/* func_0202080c: predicated-bypass + 2-call. If p->h_2 != 8,
 * return h_2 (predicated `ldmneia`). Else call f1(9) and
 * return f2().
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x8
 *     ldmneia sp!, {r3, pc}
 *     mov   r0, #0x9
 *     bl    func_0201f0e4
 *     bl    func_02093b08
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201f0e4(int x);
extern int func_02093b08(void);

int func_0202080c(unsigned short *p) {
    int v = p[1];
    if (v != 8) return v;
    func_0201f0e4(9);
    return func_02093b08();
}
