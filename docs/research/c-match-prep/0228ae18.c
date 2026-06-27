/* CAMPAIGN-PREP candidate for func_0228ae18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     de94 guard then loop 0..10; rsb 1-(sel&1) as arg1; reload sel each iter
 *   risk:       loop arg1 = rsb #1 of (ctx->sel&1) i.e. 1 - bit, recomputed from reloaded [r5,#2] each pass (r0=b,r1=1-bit,r2=i); if mwcc hoists 1-bit out, the per-iter ldrh/lsl/rsb diverge. reshape-able (keep a->sel inside loop).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;

typedef struct { u16 unk0; u16 sel; } Ctx;

extern int func_ov002_022018cc(Ctx *, int, int);
extern int func_ov002_0223de94(Ctx *, int);

int func_ov002_0228ae18(Ctx *a, Ctx *b)
{
    s32 i;
    int r;

    if (b == 0)
        return 0;
    r = func_ov002_0223de94(b, 0);
    if ((a->sel & 1) != (r & 0xff))
        return 0;
    i = 0;
    do {
        if (func_ov002_022018cc(b, 1 - (a->sel & 1), i) != 0)
            return 1;
        i++;
    } while (i <= 10);
    return 0;
}
