/* CAMPAIGN-PREP candidate for func_021d7100 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     both slot ids into temps (unconditional load); kind 0x3e; flag arg0
 *   risk:       permuter-class: heaviest reg pressure of the batch — orig computes 4 unpacks + 2 mla indexes with both player-bases and the 0x14 stride live simultaneously. mwcc's colouring of idA/idB index regs almost certainly rotates vs orig; reg-alloc wall, not reshape.
 *   confidence: low
 */
/* func_ov002_021d7100: dual-arg byte-unpack, two mla slot indexes, many live
 * temps (cls C). Unpack arg1 and arg2 (lo byte player, hi byte row), read both
 * slots' :13 id; proceed only if BOTH are set. The orig computes both indexes
 * and loads both ids UNCONDITIONALLY (no short-circuit) — so read both into
 * temps before the test. Then 021d6dbc x2, post kind 0x3e via 021d479c (flag
 * from arg0), 021d6e70 x2. Mirrors the shipped .s. */
#include "ov002_core.h"

extern int  func_ov002_021d6dbc(int a, int b);
extern void func_ov002_021d6e70(int a, int b);

void func_ov002_021d7100(int arg0, int arg1, int arg2) {
    unsigned int idA = ((struct Ov002Slot *)(data_ov002_022cf16c +
        ((arg2 & 0xff) & 1) * 0x868 + ((arg2 >> 8) & 0xff) * 0x14 + 0x30))->id;
    unsigned int idB = ((struct Ov002Slot *)(data_ov002_022cf16c +
        ((arg1 & 0xff) & 1) * 0x868 + ((arg1 >> 8) & 0xff) * 0x14 + 0x30))->id;
    if (idB == 0 || idA == 0)
        return;
    func_ov002_021d6dbc(arg1, arg2);
    func_ov002_021d6dbc(arg2, arg1);
    func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 0x3e), arg1, arg2, 0);
    func_ov002_021d6e70(arg1, arg2);
    func_ov002_021d6e70(arg2, arg1);
}
