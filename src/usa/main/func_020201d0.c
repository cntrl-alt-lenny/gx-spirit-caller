/* func_020201d0: branch-on-halfword. If p->h_2 != 0 →
 * func_0201f148; else func_0201f0e4(1).
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     beq   .L_0202023c
 *     bl    func_0201f148
 *     ldmia sp!, {r3, pc}
 *  .L_0202023c:
 *     mov   r0, #0x1
 *     bl    func_0201f0e4
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201f148(void);
extern int func_0201f0e4(int x);

int func_020201d0(unsigned short *p) {
    if (p[1] != 0) return func_0201f148();
    return func_0201f0e4(1);
}
