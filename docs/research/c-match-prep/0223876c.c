/* CAMPAIGN-PREP candidate for func_0223876c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone-guard with extra {r3,r4,r5} frame; obj(r5)/arg1(r4) callee-saved; 02257b48-gate then tail 0221074c
 *   risk:       struct-guessed/permuter-class: 02257b48 arity unproven — asm leaves both r0=obj,r1=arg1 live at the bl (could be 1 arg). If it's 1-arg, drop arg1 there; the f9-compare reg-coloring (r3/r4/r5 perm) may also need permuter.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0223876c (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 *   recipe:  same guard as 02237ca4 (b0:1/f1:5,h4:6/:9,row:13/:8); obj & arg1
 *            held callee-saved; two guarded tail calls, both passed (obj,arg1).
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct ObjHdr {
    u16 f0;
    u16 b0 : 1; u16 f1 : 5; u16 : 6; u16 hi2 : 2;
    u16 : 6; u16 f9 : 9; u16 : 1;
};
struct Row16 { u32 : 13; u32 b13 : 1; u32 : 8; u32 hi8 : 8; u32 : 2; };

extern char data_ov002_022cf16c[];
extern u16  data_ov002_022cf1a4[];
extern int  func_ov002_02257b48(struct ObjHdr *p, int arg1);
extern int  func_ov002_0221074c(struct ObjHdr *p, int arg1);

int func_ov002_0223876c(struct ObjHdr *p, int arg1) {
    struct Row16 *r = (struct Row16 *)(data_ov002_022cf16c + p->b0 * 0x868 + 0x30 + p->f1 * 0x14);
    if (p->f9 != (u32)((r->hi8 << 1) + r->b13))
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + p->b0 * 0x868 + p->f1 * 0x14) == 0)
        return 0;
    if (func_ov002_02257b48(p, arg1) == 0)
        return 0;
    return func_ov002_0221074c(p, arg1);
}
