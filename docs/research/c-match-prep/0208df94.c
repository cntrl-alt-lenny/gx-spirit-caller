/* CAMPAIGN-PREP candidate for func_0208df94 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls-pc switch on DISPCNT&7; sb=(BG0CNT>>8)&0x1f; condmov on bit7
 *   risk:       the if/movne/moveq tail (case4-6) must regen as movne/addne + moveq/addeq, not a branch; asm hoists sb before the switch. case0 and default(7) both ret0 (the 8th table slot is b .L_9c). reshape-able; condmov vs branch is the main coin-flip.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208df94 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D, branch-table (addls pc) over the
 * low 3 BG-mode bits of DISPCNT-sub (0x04001000); builds a VRAM/screen base
 * from BG0CNT-sub screen-base field ((0x0400100e>>8)&0x1f). func() -> u32 addr.
 *   mode = *0x04001000 & 7;  sb = (*0x0400100e & 0x1f00) >> 8;
 *   modes 1..3 : (sb<<11) + 0x6200000
 *   modes 4..6 : if BG0CNT&0x80 (sb<<14)+0x6200000 else (sb<<11)+0x6200000
 *   mode 0 / else : 0
 */
#include <nitro/types.h>

u32 func_0208df94(void)
{
    int mode = *(vu32 *)0x04001000 & 7;
    u16 bgcnt = *(vu16 *)0x0400100e;
    int sb = (bgcnt & 0x1f00) >> 8;

    switch (mode) {
    case 1:
    case 2:
    case 3:
        return (sb << 11) + 0x6200000;
    case 4:
    case 5:
    case 6:
        if (bgcnt & 0x80)
            return (sb << 14) + 0x6200000;
        return (sb << 11) + 0x6200000;
    default:
        return 0;
    }
}
