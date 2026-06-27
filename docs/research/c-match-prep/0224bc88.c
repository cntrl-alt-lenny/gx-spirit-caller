/* CAMPAIGN-PREP candidate for func_0224bc88 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     count<=0 out; do/while; :13 id RE-READ (ldr+lsl19;lsr19 twice) for type-call then cmp arg1
 *   risk:       arg1 held in r7 across the whole loop while the slot word is re-loaded+re-extracted per the second compare; mwcc may CSE the two id reads into one (orig keeps two distinct ldr;lsl;lsr). reshape-able only if mwcc honors two reads; else permuter-class scheduling.
 *   confidence: low
 */
/* func_ov002_0224bc88: scan player's cf16c +0x418 sub-array (count cf180[p],
 * at base+0x14); for each entry whose :13 id has func_0202b878 type 0xd AND a
 * SECOND :13 field-read != arg1, gated by 021c33e4, post kind 14 via 02253458.
 * cls D: id read twice (type call, then bitfield compare vs arg1=r7), :13 id
 * bitfield, count<=0 early-out. */
#include "ov002_core.h"
extern int func_0202b878(int a);
extern int func_ov002_021c33e4(int a, int b, int c);
void func_ov002_0224bc88(int player, int arg1, int arg2) {
    char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    char *ptr;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) <= 0)
        return;
    ptr = base + 0x418;
    do {
        if (func_0202b878(((struct Ov002Slot *)ptr)->id) == 0xd
            && arg1 != ((struct Ov002Slot *)ptr)->id
            && func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
        ptr += 4;
    } while (i < *(int *)(base + 0x14));
}
