/* CAMPAIGN-PREP candidate for func_0208e0a0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls-pc switch on DISPCNT&7; sb=(reg>>8)&0x1f; case1-5 A, case6 condmov
 *   risk:       case grouping (1-5 -> .L_184, 6 -> .L_190, 7 -> .L_1a8 ret0, 0/default -> .L_1b0 ret0) must reproduce that exact jump-table; C switch table-fill order is the coin-flip. condmov tail same as siblings. reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208e0a0 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D, branch-table variant of 0208df94.
 * Same DISPCNT-sub (0x04001000) mode dispatch; screen-base from a different
 * BG control reg (0x0400100c = BG... main/sub). Case grouping differs:
 *   mode = *0x04001000 & 7;  sb = (*0x0400100c & 0x1f00) >> 8;
 *   modes 1..5 : (sb<<11) + 0x6200000
 *   mode  6    : if reg&0x80 (sb<<14)+0x6200000 else (sb<<11)+0x6200000
 *   mode 7 / 0 / else : 0
 */
#include <nitro/types.h>

u32 func_0208e0a0(void)
{
    int mode = *(vu32 *)0x04001000 & 7;
    u16 bgcnt = *(vu16 *)0x0400100c;
    int sb = (bgcnt & 0x1f00) >> 8;

    switch (mode) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        return (sb << 11) + 0x6200000;
    case 6:
        if (bgcnt & 0x80)
            return (sb << 14) + 0x6200000;
        return (sb << 11) + 0x6200000;
    default:
        return 0;
    }
}
