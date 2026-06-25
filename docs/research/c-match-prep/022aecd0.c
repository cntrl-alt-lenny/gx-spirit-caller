/* CAMPAIGN-PREP candidate for func_022aecd0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear call sequence + one guard; constant-fold subtract arg
 *   risk:       r1=-1 may be emitted as mvn r1,#0 instead of mov 0x3a/sub 0x3b unless written exactly as 0x3a-0x3b; keep that literal form.
 *   confidence: med
 */
/* func_ov002_022aecd0: save arg(r4). func_ov002_022598d0(arg1). If global
 * data_022d0f2c.f_c8 != 0 -> func_ov002_0229a414(0). Then
 * func_ov002_022ae9c0(arg0,0); finally func_02037208(0x3a,-1,0,1)
 * (0x3a, 0x3a-0x3b=-1, 0, 1).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     mov   r0, r1 ; bl func_ov002_022598d0
 *     ldr   r0, =data_022d0f2c
 *     ldr   r0, [r0, #0xc8]
 *     cmp   r0, #0x0
 *     beq   .L_84
 *     mov   r0, #0x0 ; bl func_ov002_0229a414
 *  .L_84:
 *     mov   r0, r4 ; mov r1, #0x0 ; bl func_ov002_022ae9c0
 *     mov   r0, #0x3a
 *     sub   r1, r0, #0x3b          ; r1 = -1
 *     mov   r2, #0x0
 *     mov   r3, #0x1
 *     bl    func_02037208
 *     ldmia sp!, {r4, pc}
 */

struct G022d0f2c_c8 {
    char _pad0[0xc8];
    int  f_c8;
};
extern struct G022d0f2c_c8 data_ov002_022d0f2c;

extern void func_ov002_022598d0(int a);
extern void func_ov002_0229a414(int a);
extern void func_ov002_022ae9c0(void *p, int v);
extern void func_02037208(int a, int b, int c, int d);

void func_ov002_022aecd0(void *p, int a) {
    func_ov002_022598d0(a);
    if (data_ov002_022d0f2c.f_c8 != 0)
        func_ov002_0229a414(0);
    func_ov002_022ae9c0(p, 0);
    func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
}
