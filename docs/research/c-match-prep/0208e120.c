/* CAMPAIGN-PREP candidate for func_0208e120 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch->branch-table; precompute m,col live across cases; reload DISPCNT
 *   risk:       jump-table layout + shift-add scheduling of m<<16/col<<11; mwcc may pick movcc form or reorder cases. permuter-class (hardware-resolver, struct-guessed field bits).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0208e120 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * VRAM-bank address resolver: switch on DISPCNT BG-mode (bits0-2), returning a
 * computed VRAM address. Two field values (m=disp-mode bits27-29, col=(reg035c-area
 * >>8)&0x1f) are precomputed before the jump table so they are live in every case.
 *   selector mode = DISPCNT & 7; cmp #6 / addls pc => 7-entry branch table.
 *   modes 0-4 => 0x6000000 + (m<<16) + (col<<11)
 *   mode 5    => (reg000c & 0x80) ? 0x6000000 + (col<<14)
 *                                 : 0x6000000 + (m<<16) + (col<<11)
 *   mode 6    => 0x6000000 ; default(>6) => 0
 * NB jump-table order: ip=0->.L_214(modes0-4), ip=5->.L_220, ip=6->.L_238,
 *    addls-not-taken(>6)->.L_240. DISPCNT is read TWICE in orig (reload). */
typedef unsigned int   u32;
typedef unsigned short u16;

u32 func_0208e120(void)
{
    u32 dispcnt = *(volatile u32 *)0x04000000;
    u16 reg000c = *(volatile u16 *)0x0400000c;
    u32 mode = dispcnt & 7;
    u32 m   = (*(volatile u32 *)0x04000000 & 0x38000000) >> 27;
    u32 col = (reg000c >> 8) & 0x1f;

    switch (mode) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
        return 0x6000000 + (m << 16) + (col << 11);
    case 5:
        if (reg000c & 0x80)
            return 0x6000000 + (col << 14);
        return 0x6000000 + (m << 16) + (col << 11);
    case 6:
        return 0x6000000;
    default:
        return 0;
    }
}
