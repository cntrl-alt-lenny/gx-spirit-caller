/* CAMPAIGN-PREP candidate for func_02227da0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     and r4=v&0xff FIRST (decl lo before hi); hi via (u16)v>>8; bound across reuse
 *   risk:       asm computes lo (and r4) before hi (uses r1=v<<16,lsr16,asr8) — decl-order lo-then-hi must hold or r4/r5 swap. Reshape-able: keep lo declared/assigned first.
 *   confidence: med
 */
// func_ov002_02227da0 — ov002 EUR, class C
// 0223de94 returns packed; byte-split into bound r4/r5; three calls

typedef struct Obj Obj;
struct Obj { int dummy; };

extern int func_ov002_0223df38(Obj *, int, int);
extern int func_ov002_0223de94(Obj *, int);
extern int func_ov002_0225764c(Obj *, int, int);
extern int func_ov002_021d91e0(int, int, int);

int func_ov002_02227da0(Obj *self)
{
    int v, lo, hi;

    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;

    v = func_ov002_0223de94(self, 0);
    lo = v & 0xff;
    hi = ((v << 0x10) >> 0x10 >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0)
        return 0;

    func_ov002_021d91e0(lo, hi, 1);
    return 0;
}
