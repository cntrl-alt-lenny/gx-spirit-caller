/* CAMPAIGN-PREP candidate for func_0224e78c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield held in sl across 3 bls; do/while count; &&-chain; const 3,0xb literals
 *   risk:       id held in sl (callee-saved) across 3 calls; if mwcc reloads slots[i].id per call, ldr;lsl;lsr triples. && short-circuit order must match. reshape-able (bind int id once at loop top).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224e78c (ov002, class D, MED tier) — brief 069.
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note if <100%.
 *   recipe:     id:13 bitfield; cf178 guard; row+0x120 array; 3-deep pred chain; do/while
 *   confidence: med
 */
/* func_ov002_0224e78c: per-player slot scan (kind 0xb). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), func_ov002_021b9128(id,3)(!=0),
 * func_ov002_021ca440(player,id)(!=0), post a kind-0xb entry. Guard cf178;
 * slot array row+0x120; count row+0xc; stride 4. id held across the 3 bls. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_ov002_021b9128(int id, int kind);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224e78c(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf178 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x120))[i].id;
        if (func_0202e234(id) != 0 &&
            func_ov002_021b9128(id, 3) != 0 &&
            func_ov002_021ca440(player, id) != 0)
            func_ov002_02253458(player, 0xb, i);
        i++;
    } while (i < *(u32 *)(row + 0xc));
}
