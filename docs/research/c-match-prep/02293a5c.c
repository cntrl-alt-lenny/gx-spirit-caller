/* CAMPAIGN-PREP candidate for func_02293a5c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: acc(r4) declared first then i(r7); loop var passed pre-increment; constant 1 hoisted to r6
 *   risk:       orig hoists loop-invariant args side-reload + const1(r6) + i(r7) into callee-saved regs; mwcc may instead re-extract f0 inside loop or not hoist const1, changing reg map. reshape-able via decl-order
 *   confidence: med
 */
typedef struct Unit {
    unsigned short field0;
    unsigned short f0 : 1;
    unsigned short f1 : 5;
    unsigned short pad6 : 6;
    unsigned short f12 : 2;
    unsigned short f14 : 1;
    unsigned short pad15 : 1;
} Unit;

extern int func_ov002_021be384(int side, int i, int one);
extern int func_ov002_02259f74(int side);

int func_ov002_02293a5c(Unit *u) {
    int acc = 0;
    int i;
    if (func_ov002_02259f74(u->f0) == 0)
        return acc;
    for (i = 0; i <= 4; i++)
        acc += func_ov002_021be384(u->f0, i, 1);
    return acc >= 2 ? 1 : 0;
}
