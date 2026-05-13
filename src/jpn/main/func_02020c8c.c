/* func_02020c8c: predicated-bypass + 2-call.
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_0201f148
 *     mov   r0, #0x9
 *     bl    func_0201f0e4
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201f148(void);
extern int func_0201f0e4(int x);

int func_02020c8c(unsigned short *p) {
    int v = p[1];
    if (v == 0) return v;
    func_0201f148();
    return func_0201f0e4(9);
}
