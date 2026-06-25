/* CAMPAIGN-PREP candidate for func_0226c708 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind shared products s,t; Ov002Slot :13 id; if-guards not &&; decl sum,s,t,id in asm order
 *   risk:       orig keeps (arg0&1)*0x868 in r3 and sum*0x14 in r2 across BOTH cf16c+cf1a4 reads; if mwcc recomputes either product for the 2nd table, 1-2 mul/add diverge. reshape-able (bind both products).
 *   confidence: med
 */
/* func_ov002_0226c708: guard chain + shared (player&1)*0x868 and sum*0x14
 * index products feeding TWO per-player tables (cf16c slot.id :13, then
 * cf1a4 u16); struct-base bind = keep both products live (orig holds them in
 * r3/r2 across both reads). */
#include "ov002_core.h"

extern int func_0202e234(int id);
extern int func_0202e2f8(int id);
extern int func_02030808(int id);

struct W016c { char _p[0xd94]; int f_d94; };

int func_ov002_0226c708(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    int s, t, id;
    if (arg0 != ((struct W016c *)data_ov002_022d016c)->f_d94) return 0;
    if (sum > 4) return 0;
    s = (arg0 & 1) * 0x868;
    t = sum * 0x14;
    id = ((struct Ov002Slot *)(data_ov002_022cf16c + s + t + 0x30))->id;
    if (id == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + s + t) == 0) return 0;
    if (func_0202e234(id) == 0) return 0;
    if (func_0202e2f8(id) != 0) return 0;
    return func_02030808(id) ? 0x800 : 0;
}
