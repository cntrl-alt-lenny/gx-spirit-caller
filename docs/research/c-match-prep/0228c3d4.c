/* CAMPAIGN-PREP candidate for func_0228c3d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: counted loop slot[5..9]; bind player + induction ptr; hoisted const-0 4th arg; id:13
 *   risk:       orig hoists literal 0 to r8 and holds player in r7 across calls; loop SR'd to a +0x94 pointer. mwcc may rematerialize 0 / rebuild base each iter. permuter-class on induction + callee-saved player.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228c3d4 (ov002, class C, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED. block data_022cf16c stride 0x868; second slot array at +0x94 (= slot[5]), stride 0x14, id:13.
 *   recipe:     Class C: counted loop i=5..9 over slot[i]; bind player(r7), induction ptr(r5); hoisted const 0 (r8) for 4th arg; id:13 guard
 *   risk:       orig hoists the literal 0 into r8 before the loop and holds player in r7 across both calls; loop is SR'd to a slot pointer starting at +0x94. mwcc may rematerialize the 0 / re-form the base each iter. permuter-class: loop induction + callee-saved player.
 *   confidence: med
 */
typedef unsigned int u32;
typedef unsigned char u8;
typedef struct { u32 id : 13; u32 : 19; } Ov2Slot;
typedef struct { u8 _pad00[0x30]; Ov2Slot slot[100]; } Ov2Field; /* stride 0x868 */

extern Ov2Field data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int player, int i);
extern int func_ov002_021fbf74(int a, int b, int i, int z);

int func_ov002_0228c3d4(int player, int arg) {
    int i;
    for (i = 5; i < 10; i++) {
        if (data_ov002_022cf16c[player & 1].slot[i].id == 0) continue;
        if (arg != func_ov002_021b9ecc(player, i)) continue;
        if (func_ov002_021fbf74(player, player, i, 0) != 0) return 1;
    }
    return 0;
}
