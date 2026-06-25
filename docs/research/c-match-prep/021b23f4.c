/* CAMPAIGN-PREP candidate for func_021b23f4 (ov015, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: clamp as two if-assigns (movlt/movgt); compute span (ip) early and hold; equal-guard returns 0 before the div call.
 *   risk:       reshape-able: span(ip=f0x56-f0x4e) is loaded early and held across the clamp; reload of f0x5c/f0x60 in the guard must RE-read (orig does ldr again). The duplicate p->f5c/p->f60 reads shown force that; mul operand order ip*(v-lo) picks r0.
 *   confidence: med
 */
/* func_ov015_021b23f4: clamp v into [lo=f0x60, hi=f0x5c], store to f0x68; then if the
 * span (hi!=lo) interpolate ((v-lo)*(f0x56-f0x4e))/(hi-lo) via 020b3870, else 0; store f0x4. */
extern int func_020b3870(int num, int den);

struct obj015 {
    char _a[4]; int f4;              /* +0x04 result */
    char _b[0x4e - 8];
    short f4e;                        /* +0x4e */
    char _c[0x56 - 0x50];
    short f56;                        /* +0x56 */
    char _d[0x5c - 0x58];
    int f5c;                          /* +0x5c  hi */
    int f60;                          /* +0x60  lo */
    char _e[0x68 - 0x64];
    int f68;                          /* +0x68  clamped */
};

void func_ov015_021b23f4(int obj, int v)
{
    struct obj015 *p = (struct obj015 *)obj;
    int lo = p->f60;
    int span = p->f56 - p->f4e;
    int hi;
    int out;

    if (v < lo) v = lo;
    hi = p->f5c;
    if (v > hi) v = hi;
    p->f68 = v;
    if (p->f60 == p->f5c)
        out = 0;
    else
        out = func_020b3870(span * (v - p->f60), p->f5c - p->f60);
    p->f4 = out;
}
