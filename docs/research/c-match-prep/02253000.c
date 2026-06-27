/* CAMPAIGN-PREP candidate for func_02253000 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer eor index player^j (j<2); :13 id; sl+0x1c count, sl+0x5d0 array; inner do/while; kind 0xf held in r4 (021c988c arg + sink arg)
 *   risk:       orig keeps kind 0xf in two callee-saved regs (r4,r5) reused for both the 021c988c arg and the sink arg across the nested loop; literal 0xf twice may not mirror that callee-saved sharing. permuter-class (callee-saved const sharing + nested-loop reg-alloc)
 *   confidence: med
 */
/* func_ov002_02253000 (ov002, class D, MED) — nested loop, eor index, kind 15.
 * Outer j over {player^0, player^1}; base = cf16c + (idx&1)*0x868; count at sl+0x1c;
 * slot array sl+0x5d0. For each slot whose :13 id passes func_0202e234(!=0) and
 * func_ov002_021c988c(idx,15,i)!=0, post kind-15 (idx,15,i). */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_ov002_021c988c(int player, int kind, int idx);
void func_ov002_02253000(int player) {
    int j;
    for (j = 0; j < 2; j++) {
        int idx = player ^ j;
        char *sl = (char *)data_ov002_022cf16c + (idx & 1) * 0x868;
        int i = 0;
        if (*(int *)(sl + 0x1c) == 0)
            continue;
        do {
            int id = ((struct Ov002Slot *)(sl + 0x5d0))[i].id;
            if (func_0202e234(id) != 0 &&
                func_ov002_021c988c(idx, 0xf, i) != 0)
                func_ov002_02253458(idx, 0xf, i);
            i++;
        } while (i < *(u32 *)(sl + 0x1c));
    }
}
