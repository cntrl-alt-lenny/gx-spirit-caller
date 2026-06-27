/* CAMPAIGN-PREP candidate for func_02086848 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     smull>>8 = (s64)a*t>>8; bind f2c, reload f2e for <<15; match sub-vs-add inner shapes
 *   risk:       permuter-class+struct-guessed: orig RELOADS in->f2e (ldrh) for the final <<15 while binding f2c in r5; straight-line code makes mwcc likely CSE f2e into one reg - can't force the reload without volatile. Offsets inferred.
 *   confidence: med
 */
/* func_02086848: fixed-point matrix/vector builder. out=r0, in=r1.
 * out->f0 = in->f18; out->f14 = in->f1c; out->f4 = 0; out->f10 = 0.
 * out->f30 = (int)(((s64)in->f18 * (((-c)<<11) - in->f24*c)) >> 8) + (c<<15)
 *            where c = in->f2c (u16, kept in one reg, reused for the <<15).
 * out->f34 = (int)(((s64)in->f1c * (in->f28*e + ((-e)<<11))) >> 8) + (e<<15)
 *            where e = in->f2e (u16); note final (e<<15) RELOADS in->f2e.
 * Inner expr SHAPES differ between the two blocks (sub vs add) - matched. */

typedef struct In_02086848 {
    char           _pad0[0x18];
    int            f_18;   /* +0x18 */
    int            f_1c;   /* +0x1c */
    char           _pad20[0x24 - 0x20];
    int            f_24;   /* +0x24 */
    int            f_28;   /* +0x28 */
    unsigned short f_2c;   /* +0x2c */
    unsigned short f_2e;   /* +0x2e */
} In_02086848;

typedef struct Out_02086848 {
    int f_0;    /* +0x0  */
    int f_4;    /* +0x4  */
    char _pad8[0x10 - 0x8];
    int f_10;   /* +0x10 */
    int f_14;   /* +0x14 */
    char _pad18[0x30 - 0x18];
    int f_30;   /* +0x30 */
    int f_34;   /* +0x34 */
} Out_02086848;

void func_02086848(Out_02086848 *out, In_02086848 *in)
{
    unsigned short c = in->f_2c;
    int t;

    out->f_0  = in->f_18;
    out->f_14 = in->f_1c;
    out->f_4  = 0;

    t = ((-(int)c) << 11) - in->f_24 * c;
    out->f_30 = (int)(((long long)in->f_18 * t) >> 8) + (c << 15);

    t = in->f_28 * in->f_2e + ((-(int)in->f_2e) << 11);
    out->f_34 = (int)(((long long)in->f_1c * t) >> 8) + (in->f_2e << 15);

    out->f_10 = 0;
}
