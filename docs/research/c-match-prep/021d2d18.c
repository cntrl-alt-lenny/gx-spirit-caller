/* CAMPAIGN-PREP candidate for func_021d2d18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shifted-or pack (h4<<16)|h6; load *p then indexed store before the post; flag ?1:0
 *   risk:       orig packs via lsl#16 on BOTH halves + orr lsr#16 (h6 roundtripped); with u16 h6 mwcc may emit plain `orr r3,r3,r6` not `orr,lsr#16`. reshape-able (widen h6 to int so the lsl#16;lsr#16 mask is forced).
 *   confidence: med
 */
/* func_ov002_021d2d18 (ov002, class C) — campaign-prep, UNVERIFIED.
 * flag from sign-bit; h6=h@6,h4=h@4,h2=h@2. p=func_021b9b64(h6); store *p into
 * cdc88[h4]; post cmd 0x2b with packed (h4<<16)|h6 as arg3; clear +0x80c.
 * The *p load happens before the post; the indexed store before the bl. */
#include "ov002_core.h"

extern char data_ov002_022cdc88[];
extern int *func_ov002_021b9b64(int h6);

void func_ov002_021d2d18(void) {
    int flag;
    u16 h6;
    u16 h4;
    u16 h2;
    int w;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    h6 = *(u16 *)(data_ov002_022ce950 + 0x6);
    h4 = *(u16 *)(data_ov002_022ce950 + 0x4);
    h2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    w = *func_ov002_021b9b64(h6);
    *(int *)(data_ov002_022cdc88 + h4 * 4) = w;
    func_ov002_0229ade0(0x2b, flag, h2, ((unsigned int)h4 << 16) | h6);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
