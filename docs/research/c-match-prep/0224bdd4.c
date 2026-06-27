/* CAMPAIGN-PREP candidate for func_0224bdd4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single word load; derive id+(2*B+topbit) both; symmetric <<19>>19 id; cmp==4 (ldmne)
 *   risk:       id derivation: symmetric `(word<<19)>>19` folds to `and #0x1fff` (the gotcha) but ORIG uses lsl#19;lsr#19 (r3=word<<19 then r6=r3>>19). Must be a :13 bitfield member to get lsl;lsr -> use struct read of the same word. struct-guessed/reshape-able: read id via Ov002Slot on a union, keep single load.
 *   confidence: med
 */
/* func_ov002_0224bdd4: idx slot in player's cf16c block; SINGLE load of the
 * packed word derives BOTH the :13 id (field B branch) and 2*B+topbit. Require
 * func_ov002_021c38c4(player, 2*B+topbit) == 4 and 021ca440(player, id), then
 * post kind 11 via 02253458. cls D: one ldr, two derivations (no reload),
 * :13 id via lsl19;lsr19, B/C asymmetric extract. */
#include "ov002_core.h"
extern int func_ov002_021c38c4(int player, int arg1);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224bdd4(int player, int arg1, int idx) {
    char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    unsigned int word = *(unsigned int *)(base + idx * 4 + 288);
    int packed = (int)(((unsigned)(word << 2) >> 24) * 2 + ((unsigned)(word << 18) >> 31));
    int id = (int)((word << 19) >> 19);
    if (func_ov002_021c38c4(player, packed) != 4)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
