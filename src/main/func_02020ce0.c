/* func_02020ce0: predicated-bypass + 2-call.
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_0201f19c
 *     mov   r0, #0x9
 *     bl    func_0201f138
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201f19c(void);
extern int func_0201f138(int x);

int func_02020ce0(unsigned short *p) {
    int v = p[1];
    if (v == 0) return v;
    func_0201f19c();
    return func_0201f138(9);
}
