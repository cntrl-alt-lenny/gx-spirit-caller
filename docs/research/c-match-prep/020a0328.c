/* CAMPAIGN-PREP candidate for func_020a0328 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null+field guards + sub-struct@0x800 + two u16 zero stores
 *   risk:       0x800 sub-struct + f0e/f16/f1c offsets guessed; mwcc may emit mov r2,#0 not mov r2,r1; store scheduling could reorder
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020a0328 (main, class A) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     null guard (movs/moveq #6) + sub-struct at 0x800; guard f0e!=0; call; two halfword stores of 0 in source order; return 0
 *   risk:       sub-struct at +0x800 with u16 fields f0e(0xe)/f16(0x16)/f1c(0x1c); base p+0x800 recomputed after call (only r4 callee-saved)
 */
extern int func_0209e7f0(int a, int b, int c);

struct Sub {
    char _pad0[0x0e]; unsigned short f0e;            /* 0x0e */
    char _pad10[0x16 - 0x10]; unsigned short f16;    /* 0x16 */
    char _pad18[0x1c - 0x18]; unsigned short f1c;    /* 0x1c */
};
struct Obj { char _pad0[0x800]; struct Sub sub; };   /* sub at 0x800 */

int func_020a0328(struct Obj *p) {
    if (p == 0) return 6;
    if (p->sub.f0e == 0) return 3;
    func_0209e7f0(p->sub.f16, 0, 0);
    p->sub.f0e = 0;
    p->sub.f1c = 0;
    return 0;
}
