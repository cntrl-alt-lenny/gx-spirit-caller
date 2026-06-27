/* CAMPAIGN-PREP candidate for func_02086ea0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     smull>>12 as (long long)*>>12; (-f28) sign before smull; shifted-or operand order
 *   risk:       the f1c reload-vs-bind at the +0x34 term (orig: ldr r1,[r1,#0x1c] fresh after the t1 smull) — if mwcc CSEs f1c into t0's reg the add diverges; reshape-able (re-read field) else permuter-class.
 *   confidence: low
 */
/* func_02086ea0: builder, no sincos calls; reads precomputed cos/sin from
 * struct fields and uses the smull;lsr#12;orr#20 fixed-point multiply
 * (int)(((long long)a*b)>>12). Note f18 is RELOADED at the multiply (a store
 * to *out sits between, mwcc cannot prove out!=in -> reloads). */

typedef struct {
    char           _pad_0[0x18];
    int            f18;      /* +0x18 cos */
    int            f1c;      /* +0x1c sin */
    char           _pad_20[0x4];
    int            f24;      /* +0x24 */
    int            f28;      /* +0x28 */
    char           _pad_2c[0x0];
    unsigned short a2c;      /* +0x2c */
    unsigned short a2e;      /* +0x2e */
} mtxsrc2_t;

void func_02086ea0(int *out, mtxsrc2_t *s) {
    int t0, t1;
    out[0]      = s->f18;
    out[0x14/4] = s->f1c;
    out[0x4/4]  = 0;

    t0 = (int)(((long long)s->f24 * s->f18) >> 12);
    out[0x30/4] = (s->a2c * -t0) << 4;

    t1 = (int)(((long long)-s->f28 * s->f1c) >> 12);
    out[0x34/4] = (-s->a2e * (s->f1c + t1 - 0x1000)) << 4;
    out[0x10/4] = 0;
}
