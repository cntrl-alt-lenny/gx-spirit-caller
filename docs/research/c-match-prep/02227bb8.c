/* CAMPAIGN-PREP candidate for func_02227bb8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     out param &local; lo/hi bound (r5/r6) before two reuses; in-arg literals 2/1 spilled
 *   risk:       Stack arg layout for 021d5a08 (str #2@[sp], #1@[sp+4], ldrh f0 into r3) is guessed; if mwcc orders the spilled args differently the str sequence diverges — struct-guessed/reshape-able.
 *   confidence: med
 */
// func_ov002_02227bb8 — ov002 EUR, class C
// stack-out param to 0223df38, then byte-split into bound r5/r6

typedef struct Obj Obj;
struct Obj { unsigned short f0; };

extern int func_ov002_0223df38(Obj *, int, unsigned short *);
extern int func_ov002_0225764c(Obj *, int, int);
extern int func_ov002_021d5a08(Obj *, int, int, int, int, unsigned short);
extern int func_ov002_021e276c(int, unsigned short, int, int);

int func_ov002_02227bb8(Obj *self)
{
    unsigned short out;
    int lo, hi;

    if (func_ov002_0223df38(self, 0, &out) == 0)
        return 0;

    lo = out & 0xff;
    hi = ((int)(short)out >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0)
        return 0;

    func_ov002_021d5a08(self, lo, hi, 2, 1, self->f0);
    func_ov002_021e276c(lo, self->f0, 1, 0);
    return 0;
}
