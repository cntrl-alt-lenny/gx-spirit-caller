/* CAMPAIGN-PREP candidate for func_022afb8c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /2 as (x+(x>>>31))>>1; bind f40 to base; store-order kept
 *   risk:       reshape-able: the (f34-f30) span is recomputed inside the lerp (orig reloads f34/f30 a 2nd time at 0x34/0x30, not reusing the earlier span) -- if mwcc CSEs the two subtractions, ldr count diverges.
 *   confidence: med
 */
/* func_ov002_022afb8c: clamped linear interpolation along a segment.
 * t=r1. If t<=0: f18=0, f3c=f40. Else span=f34-f30; if t>=span: f18=span,
 * f3c=f44. Else f18=t; lerp = f40 + round(t*(f44-f40)/2 + (f34-f30)/2)?
 * Actually: num=t*(f44-f40); add half of (f34-f30) signed; pass through
 * func_020b3870 then add base f40 -> f3c. */

struct lerp {
    char pad00[0x18];
    int  f18;   /* 0x18 */
    char pad1c[0x30 - 0x1c];
    int  f30;   /* 0x30 */
    int  f34;   /* 0x34 */
    char pad38[0x3c - 0x38];
    int  f3c;   /* 0x3c */
    int  f40;   /* 0x40 */
    int  f44;   /* 0x44 */
};

extern int func_020b3870(int x);

void func_ov002_022afb8c(struct lerp *s, int t) {
    int base;
    int span;
    int delta;
    int num;

    if (t <= 0) {
        s->f18 = 0;
        s->f3c = s->f40;
        return;
    }

    span = s->f34 - s->f30;
    if (t >= span) {
        s->f18 = span;
        s->f3c = s->f44;
        return;
    }

    s->f18 = t;
    base = s->f40;
    delta = s->f44 - base;        /* ldr r4=f40 first, then f44 => f44-f40 */
    num = t * delta;             /* mul r2,r1,r0 */
    {
        int half = s->f34 - s->f30;
        num = num + ((half + ((unsigned)half >> 31)) >> 1); /* asr#1 with sign-bias */
    }
    s->f3c = base + func_020b3870(num);
}
