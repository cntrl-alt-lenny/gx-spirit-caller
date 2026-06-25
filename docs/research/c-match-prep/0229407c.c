/* CAMPAIGN-PREP candidate for func_0229407c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: side+1-side both as f0*0x868/(1-f0)*0x868 ldr; x(r5) reused across calls; bge early-out
 *   risk:       orig computes BOTH and lr=f0 and r3=1-f0 then two muls by the same 0x868 const before either ldr; mwcc index *0x868/4 may emit mov+mul differently and reorder the two ldr. permuter-class (twin-index scheduling)
 *   confidence: low
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

extern int data_ov002_022cf16c[];
extern int func_ov002_021b3014(int side, int x, int k);
extern int func_ov002_021c8470(int side, int x);
extern int func_ov002_02280df4(Unit *u, int side, int a, int b);

int func_ov002_0229407c(Unit *u) {
    int side = u->f0;
    int x;
    if (data_ov002_022cf16c[side * 0x868 / 4] >= data_ov002_022cf16c[(1 - side) * 0x868 / 4])
        return 0;
    x = func_ov002_02280df4(u, side, -1, 0);
    if (func_ov002_021b3014(u->f0, x, 0x1237) != 0)
        x = func_ov002_02280df4(u, u->f0, x, 0);
    if (x < 0)
        return 0;
    if (func_ov002_021c8470(u->f0, x) >= 0x5dc)
        return 1;
    return 0;
}
