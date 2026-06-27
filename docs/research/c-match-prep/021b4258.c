/* CAMPAIGN-PREP candidate for func_021b4258 (ov019, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: counted copy loops; index-reg addressing via i*4 short stride; store-order f4,f8,fc,f10 as orig; ldrsh -> signed short.
 *   risk:       struct-guessed: G19 layout (fields at 0/4/8/0xc/0x10, rows at 0x34) and Pair/Quad shapes inferred from offsets; arg0 fields at [8],[0xc]. Loop bodies tractable so reshape-able if only offsets wrong.
 *   confidence: med
 */
// func_ov019_021b4258 : two counted copy loops + struct fill into a global
extern void func_ov005_021aa4b0(void *g);

struct Pair { short a, b; };                 // src table, 10 entries (40 bytes)
struct Quad { short s[4]; };                 // 5 entries copied to g+0x34
extern struct Pair data_ov019_021b5a28[10];  // _LIT1
struct G19 { int f0; int f4; int f8; int fc; int f10;
             char pad[0x34-0x14]; struct Quad rows[5]; };
extern struct G19 data_ov000_021b1d4c;       // _LIT0

int func_ov019_021b4258(int *arg0)
{
    struct Pair tmp[10];
    struct G19 *g = &data_ov000_021b1d4c;
    int i;

    for (i = 0; i < 10; i++) {
        tmp[i].a = data_ov019_021b5a28[i].a;
        tmp[i].b = data_ov019_021b5a28[i].b;
    }

    if (arg0[8/4] > 6) {
        func_ov005_021aa4b0(g);
        g->f0 = 0;
        for (i = 0; i < 5; i++) {
            short *src = ((short *)tmp) + i * 4;   // ldrsh stride i*8
            g->rows[i].s[0] = src[0];
            g->rows[i].s[1] = src[1];
            g->rows[i].s[2] = src[2];
            g->rows[i].s[3] = src[3];
        }
        g->f4  = arg0[0xc/4];
        g->f8  = arg0[8/4] - 6;
        g->fc  = 6;
        g->f10 = 0;
    }
    return 1;
}
