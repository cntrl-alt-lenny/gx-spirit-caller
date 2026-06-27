/* CAMPAIGN-PREP candidate for func_0224e8fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     intentionally-uninit sel default (don't add else); if/else-if not switch; do/while; sel bound r5 across loop
 *   risk:       sel uninitialised on the no-match path (orig only ldreq's it) — DON'T add a default else (would add a mov); orig emits 0x183d-0xbb as sub not const 0x1782, and the cmp ladder order (eq 0x183d first) drives branch layout. reshape-able (keep sub form + uninit default).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224e8fc (ov002, class D, MED tier) — brief 069.
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note if <100%.
 *   recipe:     discriminant select (uninit default) prologue; cf180 guard; row+0x418 array; 2 preds; do/while
 *   confidence: low
 */
/* func_ov002_0224e8fc: pick selector sel from arg1 (0x183d -> 0x1782, 0x1a42 ->
 * 0xfe4, else uninitialised), then per-player slot scan (kind 0xe). For each slot
 * whose id (13-bit) passes func_0202df78(id,sel)(!=0) and
 * func_ov002_021c33e4(player,player,i)(!=0), post a kind-0xe entry. Guard cf180;
 * slot array row+0x418; count row+0x14; stride 4. sel left uninit on the else. */
#include "ov002_core.h"
extern int func_0202df78(int id, int sel);
extern int func_ov002_021c33e4(int player, int a, int i);
void func_ov002_0224e8fc(int player, int which) {
    char *row;
    int i = 0;
    int sel;
    if (which == 0x183d)
        sel = 0x183d - 0xbb;
    else if (which == 0x1a42)
        sel = 0xfe4;
    row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202df78(((struct Ov002Slot *)(row + 0x418))[i].id, sel) != 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 0xe, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
