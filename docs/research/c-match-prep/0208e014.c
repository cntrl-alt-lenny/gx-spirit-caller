/* CAMPAIGN-PREP candidate for func_0208e014 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls-pc switch on DISPCNT&7; blk=(DISPCNT>>27)<<16; sb base; condmov bit7
 *   risk:       DISPCNT is read TWICE in asm (mov r2,#0x4000000; ldr; ldr) not bound to one reg - mwcc may CSE both reads into one ldr, dropping the second. reshape-able by reading via separate volatile expressions (volatile prevents CSE - should hold). condmov tail also coin-flip.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208e014 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D, branch-table over DISPCNT-main
 * (0x04000000) BG-mode bits, with a VRAM-block base from DISPCNT bits 27..29
 * (display/VRAM block) shifted into bit16. BG0CNT-main = 0x0400000e.
 *   mode  = *0x04000000 & 7;
 *   blk   = ((*0x04000000 & 0x38000000) >> 0x1b) << 0x10;
 *   sb    = (*0x0400000e & 0x1f00) >> 8;
 *   modes 1..3 : blk + 0x6000000 + (sb<<11)
 *   modes 4..6 : if BG0CNT&0x80 (sb<<14)+0x6000000 else blk+0x6000000+(sb<<11)
 *   mode 0 / else : 0
 */
#include <nitro/types.h>

u32 func_0208e014(void)
{
    u16 bgcnt = *(vu16 *)0x0400000e;
    int mode = *(vu32 *)0x04000000 & 7;
    int blk = ((*(vu32 *)0x04000000 & 0x38000000) >> 0x1b) << 0x10;
    int sb = (bgcnt & 0x1f00) >> 8;

    switch (mode) {
    case 1:
    case 2:
    case 3:
        return blk + 0x6000000 + (sb << 11);
    case 4:
    case 5:
    case 6:
        if (bgcnt & 0x80)
            return (sb << 14) + 0x6000000;
        return blk + 0x6000000 + (sb << 11);
    default:
        return 0;
    }
}
