/* CAMPAIGN-PREP candidate for func_02294478 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: f12(:2) movs test branch; eor combines f14^f0; field0=[r5] passed as r1
 *   risk:       the eor arg: orig does (lsl#11>>31)^(lsl#1f>>31) = f14^f0 placed in r0, with func_0223f6c4 result in r2 and field0 in r1; arg eval order may swap r0/r1/r2. reshape-able via operand/arg order. struct-guessed field0 width
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

extern int func_ov002_0223f6c4(void);
extern int func_ov002_022536e8(int a, int b, int c);
extern int func_ov002_02280df4(Unit *u, int side, int a, int b);
extern int func_ov002_02291160(Unit *u, int arg);

int func_ov002_02294478(Unit *u, int arg) {
    if (u->f12 == 0) {
        if (func_ov002_02280df4(u, u->f0, -1, 0) < 0)
            return 0;
        if (func_ov002_02291160(u, arg) != 0)
            return 1;
        return 0;
    }
    return func_ov002_022536e8(u->field0, func_ov002_0223f6c4(), u->f14 ^ u->f0) > 0 ? 1 : 0;
}
