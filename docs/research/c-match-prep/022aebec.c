/* CAMPAIGN-PREP candidate for func_022aebec (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard early-return; if-assign max (movlt); reload-global twice
 *   risk:       Scheduling: orig hoists mov r1,#4 before the clamp and stores f38/f40 last; mwcc may reorder the two final stores or fold the reload.
 *   confidence: med
 */
/* func_ov002_022aebec: save arg(r4). Guard: if func_ov002_022ae284(1)==0
 * return. Else func_ov002_02259834(); func_ov002_022ae9c0(arg,0); then a
 * max-with-8 on global data_022d0f2c.f_d4 (RELOADED for load and store);
 * arg->f38 = 4; arg->f40 = 1.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     mov   r0, #0x1
 *     bl    func_ov002_022ae284
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *     bl    func_ov002_02259834
 *     mov   r0, r4 ; mov r1, #0x0 ; bl func_ov002_022ae9c0
 *     ldr   r0, =data_022d0f2c
 *     mov   r1, #0x4
 *     ldr   r2, [r0, #0xd4]
 *     ldr   r0, =data_022d0f2c     ; RELOAD
 *     cmp   r2, #0x8
 *     movlt r2, #0x8               ; if (v < 8) v = 8;
 *     str   r2, [r0, #0xd4]
 *     str   r1, [r4, #0x38]        ; arg->f38 = 4
 *     mov   r0, #0x1
 *     str   r0, [r4, #0x40]        ; arg->f40 = 1
 *     ldmia sp!, {r4, pc}
 */

struct G022d0f2c {
    char _pad0[0xd4];
    int  f_d4;
};
extern struct G022d0f2c data_ov002_022d0f2c;

struct S022aebec {
    char _pad0[0x38];
    int  f38;        /* +0x38 */
    char _pad3c[4];
    int  f40;        /* +0x40 */
};

extern int  func_ov002_022ae284(int x);
extern void func_ov002_02259834(void);
extern void func_ov002_022ae9c0(struct S022aebec *p, int v);

void func_ov002_022aebec(struct S022aebec *p) {
    if (func_ov002_022ae284(1) == 0)
        return;
    func_ov002_02259834();
    func_ov002_022ae9c0(p, 0);
    if (data_ov002_022d0f2c.f_d4 < 8)
        data_ov002_022d0f2c.f_d4 = 8;
    p->f38 = 4;
    p->f40 = 1;
}
