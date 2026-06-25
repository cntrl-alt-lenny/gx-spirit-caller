/* CAMPAIGN-PREP candidate for func_022b53c4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard early-return; bool-ize call result (movne/moveq) as 3rd arg
 *   risk:       Note says draft already matches. Risk: mwcc may keep h in a different reg or evaluate the != 0 arg before binding h, flipping r4 usage.
 *   confidence: high
 */
/* func_ov002_022b53c4: save arg(r4). Guard: if func_0202d9a0()==0 return.
 * h = func_02021660(arg->f0, 3, 0); r4 = h; flag = func_0202c9a0() != 0
 * (movne/moveq into r2); func_020216b0(h, 0, flag).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0202d9a0
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *     ldr   r0, [r4]
 *     mov   r1, #0x3 ; mov r2, #0x0
 *     bl    func_02021660
 *     mov   r4, r0
 *     bl    func_0202c9a0
 *     cmp   r0, #0x0
 *     movne r2, #0x1 ; moveq r2, #0x0
 *     mov   r0, r4 ; mov r1, #0x0
 *     bl    func_020216b0
 *     ldmia sp!, {r4, pc}
 */

struct S022b53c4 {
    int f0;
};

extern int  func_0202d9a0(void);
extern int  func_02021660(int a, int b, int c);
extern int  func_0202c9a0(void);
extern void func_020216b0(int a, int b, int c);

void func_ov002_022b53c4(struct S022b53c4 *p) {
    int h;
    if (func_0202d9a0() == 0)
        return;
    h = func_02021660(p->f0, 3, 0);
    func_020216b0(h, 0, func_0202c9a0() != 0);
}
