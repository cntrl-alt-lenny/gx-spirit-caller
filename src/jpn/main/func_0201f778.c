/* func_0201f778: branch-on-halfword. If p->h_2 != 0 →
 * func_0201f148(); else func_0201f0e4(1). Branchy form (no
 * predication on the call).
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     beq   .L_0201f7e4
 *     bl    func_0201f148
 *     ldmia sp!, {r3, pc}
 *  .L_0201f7e4:
 *     mov   r0, #0x1
 *     bl    func_0201f0e4
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201f148(void);
extern int func_0201f0e4(int x);

int func_0201f778(unsigned short *p) {
    if (p[1] != 0) return func_0201f148();
    return func_0201f0e4(1);
}
