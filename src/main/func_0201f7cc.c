/* func_0201f7cc: branch-on-halfword. If p->h_2 != 0 →
 * func_0201f19c(); else func_0201f138(1). Branchy form (no
 * predication on the call).
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     beq   .L_0201f7e4
 *     bl    func_0201f19c
 *     ldmia sp!, {r3, pc}
 *  .L_0201f7e4:
 *     mov   r0, #0x1
 *     bl    func_0201f138
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201f19c(void);
extern int func_0201f138(int x);

int func_0201f7cc(unsigned short *p) {
    if (p[1] != 0) return func_0201f19c();
    return func_0201f138(1);
}
