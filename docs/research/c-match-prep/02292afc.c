/* CAMPAIGN-PREP candidate for func_02292afc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: signed short out-param => asr#8 high byte; and#0xff low byte; store-order via early-returns
 *   risk:       stack temp slot: orig sub sp,#4 + ldrh[sp]; mwcc may pick a different sp offset or widen tmp to int (ldr not ldrh). reshape-able: keep tmp as short. struct-guessed signature of 02216004
 *   confidence: med
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

extern int func_ov002_021c1e44(Unit *u, int b1);
extern int func_ov002_02216004(Unit *u, short *out);
extern int func_ov002_02280980(int side);

int func_ov002_02292afc(Unit *u) {
    short tmp;
    if (func_ov002_02280980(u->f0) > 0)
        return 0;
    if (func_ov002_02216004(u, &tmp) < 0)
        return 0;
    if ((tmp & 0xff) == u->f0)
        return 0;
    if (func_ov002_021c1e44(u, (tmp >> 8) & 0xff) == 0)
        return 1;
    return 0;
}
