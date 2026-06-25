/* CAMPAIGN-PREP candidate for func_020896cc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     zero p8c/p84/p88 in order; ldmia pair load f7c/f80 (read adjacent, in order) for the call args
 *   risk:       return value: orig reloads &data_021a5800 into r0 on the taken path and returns it (r0=literal addr) else 0 — the bool return is incidental. The final return/global-set shape is ambiguous; struct-guessed + reshape-able (may need return type void or different return expr).
 *   confidence: low
 */
// func_020896cc — zero three ptr fields, init sub-objects, set global on success
// data_021a5800: set to this object when func_020894e0 succeeds.
struct Obj {
    char pad0[0x30];
    int  p30;     // +0x30
    char pad34[0x48];
    int  f7c;     // +0x7c (loaded as pair with +0x80)
    int  f80;     // +0x80
    char pad84[0x04];
    int  p84;     // +0x84
    int  p88;     // +0x88
    int  p8c;     // +0x8c
};
extern void *data_021a5800;
extern int func_0209815c(void *a);
extern int func_02098388(void *a);
extern int func_02098088(void *a, int b, int c);
extern int func_020894e0(void *a, int b, int c, int d);

int func_020896cc(struct Obj *o, int unused1, int p2, int p3)
{
    o->p8c = 0;
    o->p84 = 0;
    o->p88 = 0;
    if (func_0209815c((char *)o + 0x7c) == 0) {
        return 0;
    }
    func_02098388((char *)o + 0x34);
    if (func_02098088((char *)o + 0x34, o->f7c, o->f80) == 0) {
        return 0;
    }
    o->p30 = 1;
    if (func_020894e0(o, p2, p3, 1) != 0) {
        data_021a5800 = o;
    }
    return (int)data_021a5800;
}
