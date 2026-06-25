/* CAMPAIGN-PREP candidate for func_0207dab4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if-zero->1, round-up-to-4 (B), sign-branch to two tail calls, sp3 frame
 *   risk:       ROUTE AS *.legacy_sp3.c. cmp r2 scheduled before bic may reorder; passing &p->mgr (p+0x24) and rsb(-align) shape; align<0 branch direction
 *   confidence: med
 */
/* func_0207dab4 (main, class B, 0x40) — align/clamp then sign-branch.
 *   push {lr}; sub sp,#4; cmp r1,#0; moveq r1,#1; add r1,r1,#3;
 *   add r0,r0,#0x24; cmp r2,#0; bic r1,r1,#3; blt .L_68;
 *   bl func_0207dbf8; pop {pc};
 * .L_68: rsb r2,r2,#0; bl func_0207db8c; pop {pc}
 * size = size?size:1; size = (size+3)&~3; mgr = &p->mgr;
 * if (align < 0) func_0207db8c(mgr,size,-align); else func_0207dbf8(mgr,size,align).
 * 1 saved reg + sub sp #4 + pop {pc} == sp3 -> *.legacy_sp3.c (mwcc 1.2/sp3).
 */

typedef struct {
    char            _pad_00[0x24];
    char            mgr[0x18];      /* +0x24 sub-object passed by address */
} obj_0207dab4_t;

extern void func_0207dbf8(void *mgr, int size, int align);
extern void func_0207db8c(void *mgr, int size, int align);

void func_0207dab4(obj_0207dab4_t *p, int size, int align) {
    if (size == 0) {
        size = 1;
    }
    size = (size + 3) & ~3;
    if (align < 0) {
        func_0207db8c(&p->mgr, size, -align);
    } else {
        func_0207dbf8(&p->mgr, size, align);
    }
}
