/* CAMPAIGN-PREP candidate for func_021df62c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: d0250 :13 bitfield lookup (lsl#19;lsr#19); 021d479c arg-pack tail; flag|0x2e
 *   risk:       reg-alloc: brief-360 catalogued this exact addr as a reg-mirror near-miss (per-player/index math shifts the whole allocation: ip=arg2<<2 then ip=arg2<<16 reuse). permuter-class.
 *   confidence: low
 */
/* func_ov002_021df62c: look up a 13-bit id from the d0250 u16 table at index arg2,
 * then dispatch func_ov002_021d479c(kind 0x2e | high-bit-from-arg0, (u16)arg1,
 * (u16)id, (u16)arg2). */
#include "ov002_core.h"

extern unsigned short data_ov002_022d0250[];

struct SlotU16 { unsigned short id : 13; };

int func_ov002_021df62c(int arg0, int arg1, int arg2) {
    unsigned int id = ((struct SlotU16 *)((char *)data_ov002_022d0250 + arg2 * 4))->id;
    return func_ov002_021d479c((unsigned short)((arg0 ? 0x8000 : 0) | 0x2e),
                               (unsigned short)arg1,
                               (unsigned short)id,
                               (unsigned short)arg2);
}
