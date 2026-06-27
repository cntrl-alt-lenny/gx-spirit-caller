/* CAMPAIGN-PREP candidate for func_0208de94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order(disp,bg); volatile=reload; signed mode->blt; accumulator-first add
 *   risk:       scheduling: orig defers `ldrh bg` past the `cmp mode,#5`; mwcc may hoist the bg load. permuter-class (load interleave).
 *   confidence: med
 */
/* func_0208de94 (main, class C) — DISPCNT/BG2CNT addr-calc variant (sibling of ddec).
 * mode = DISPCNT&7; if mode>=5 and BG2CNT bit7 set -> return 0; else compute.
 * Single threshold (>=5), no upper bound. BG addr is 0x0400000c. Compute body identical to ddec.
 * DISPCNT reloaded (volatile) at tail; bg read once; mode signed int -> blt. */
typedef unsigned short u16;
typedef unsigned int   u32;

u32 func_0208de94(void)
{
    u16 bg = *(volatile u16 *)0x0400000c;
    int mode = (int)(*(volatile u32 *)0x04000000 & 0x7);
    if (mode >= 5) {
        if (bg & 0x80)
            return 0;
    }
    return 0x6000000
         + (((*(volatile u32 *)0x04000000 & 0x7000000) >> 24) << 16)
         + (((u32)(bg & 0x3c) >> 2) << 14);
}
