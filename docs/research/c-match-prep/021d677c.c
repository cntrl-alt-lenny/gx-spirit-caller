/* CAMPAIGN-PREP candidate for func_021d677c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind pb player-base; Ov002Slot.id guard; two ternary flags; (u16) arg-pack
 *   risk:       permuter-class: orig holds pb(=(arg0&1)*0x868) and arg1*0x14 LIVE across the cf16c id-load AND the cf1a4 u16-load; core.h flags this exact addr a per-player-math reg-alloc wall.
 *   confidence: low
 */
/* func_ov002_021d677c (ov002, cls D): per-player row guard then arg-pack kind
 * 0x35 into the 021d479c sink. KNOWN reg-mirror near-miss (core.h brief 360
 * line 371 names 021d677c among the per-player-math allocation-shift class).
 * pb = (arg0&1)*0x868 player base; row stride arg1*0x14 held across two tables
 * (cf16c id-guard at +0x30, cf1a4 u16 at +0). */
#include "ov002_core.h"

extern void func_ov002_021d479c(int packed, int a, int b, int c);

void func_ov002_021d677c(int arg0, int arg1) {
    int pb = (arg0 & 1) * 0x868;
    unsigned short v;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + pb + arg1 * 0x14 + 0x30))->id == 0)
        return;
    v = *(unsigned short *)(data_ov002_022cf1a4 + pb + arg1 * 0x14);
    func_ov002_021d479c((u16)(((arg0 != 0) ? 0x8000 : 0) | 0x35),
                        (u16)arg1,
                        (u16)((v == 0) ? 1 : 0),
                        4);
}
