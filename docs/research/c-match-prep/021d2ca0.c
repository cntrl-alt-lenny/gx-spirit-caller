/* CAMPAIGN-PREP candidate for func_021d2ca0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player mla base cf16c+(p&1)*0x868; raw asymmetric shifts (no fold); +0x30+idx*20
 *   risk:       the `(field<<1)+(bit13)` combine: orig keeps both in the SAME reg via `lsl#1; add r3,r3,ip,lsr#0x1f`. mwcc may allocate a 2nd temp or reorder the two extractions. permuter-class (reg/scheduling of the dual extract).
 *   confidence: med
 */
/* func_ov002_021d2ca0: ov002 per-player row lookup (cf16c + (player&1)*0x868,
 * sub-row at +0x30 + idx*20) then extract two adjacent fields of the 32-bit
 * holder, combine (hi8field<<1 | bit13), post cmd 0x28, clear +0x80c.
 * cls D: mla per-player index + asymmetric-shift bitfield extraction. */
#include "ov002_core.h"

int func_ov002_021d2ca0(void) {
    int player;
    int idx;
    unsigned int holder;
    int combine;
    char *base;
    player = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    idx = *(unsigned short *)(data_ov002_022ce950 + 0x2);
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    holder = *(unsigned int *)(base + 0x30 + idx * 20);
    /* asymmetric shifts: do NOT fold to a mask. (holder<<2)>>24 = bits[22:29];
     * (holder<<18)>>31 = bit13. combine = field*2 + bit13. */
    combine = (int)(((holder << 2) >> 24) << 1) + (int)((holder << 18) >> 31);
    func_ov002_0229ade0(0x28, player & 1, idx, combine);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    return 0;
}
