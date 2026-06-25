/* CAMPAIGN-PREP candidate for func_021d7054 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two Ov002Slot :13 reads back-to-back for base CSE; flag on lo byte
 *   risk:       permuter-class: orig holds 0x868-base/0x14-stride in ip/r2/lr LIVE across BOTH mla indexes (currently shipped as .s). If mwcc reloads data_022cf16c per slot or rotates the index regs, the two ldr/mla blocks diverge — reg-alloc, not reshape.
 *   confidence: low
 */
/* func_ov002_021d7054: dual byte-unpack + mla slot index, reg-alloc heavy
 * (cls C). arg0/arg1 are packed ids (lo byte = player-ish, hi byte = row).
 * Proceed only if slotA(arg0) :13 id is set AND slotB(arg1) :13 id is clear;
 * then 021d6dbc, post kind 0x3d via 021d479c (flag = arg0 lo byte != 0), and
 * notify 021d6e70. Mirrors the shipped .s. The orig keeps the table base and
 * 0x868/0x14 strides LIVE across both index computations — declare both slot
 * reads back to back so the base address CSEs. */
#include "ov002_core.h"

extern int  func_ov002_021d6dbc(int a, int b);
extern void func_ov002_021d6e70(int a, int b);

void func_ov002_021d7054(int arg0, int arg1) {
    if (((struct Ov002Slot *)(data_ov002_022cf16c + ((arg0 & 0xff) & 1) * 0x868 +
                              ((arg0 >> 8) & 0xff) * 0x14 + 0x30))->id == 0)
        return;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + ((arg1 & 0xff) & 1) * 0x868 +
                              ((arg1 >> 8) & 0xff) * 0x14 + 0x30))->id != 0)
        return;
    func_ov002_021d6dbc(arg0, arg1);
    func_ov002_021d479c((u16)(((arg0 & 0xff) ? 0x8000 : 0) | 0x3d),
                        arg0, arg1, 0);
    func_ov002_021d6e70(arg0, arg1);
}
