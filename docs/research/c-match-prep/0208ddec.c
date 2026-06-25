/* CAMPAIGN-PREP candidate for func_0208ddec (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order(disp,bg); volatile=reload-each-use; signed mode->blt/bge; accumulator-first add
 *   risk:       scheduling: orig defers `ldrh bg` to after the mode cmp; mwcc may emit bg load early. permuter-class (interleave); the two volatile DISPCNT reads should match.
 *   confidence: med
 */
/* func_0208ddec (main, class C) — DISPCNT/BG3CNT addr-calc, guard + shift-add.
 * mode = DISPCNT&7; if mode in [3,6) and BG3CNT bit7 set, or mode>=6 -> return 0.
 * else return 0x6000000 + (((DISPCNT&0x7000000)>>24)<<16) + (((BG3CNT&0x3c)>>2)<<14).
 * DISPCNT is RELOADED (volatile) at the tail to reproduce the 2nd `ldr [0x4000000]`;
 * BG3CNT read once into a local and reused. mode is signed int -> blt/bge. */
typedef unsigned short u16;
typedef unsigned int   u32;

u32 func_0208ddec(void)
{
    u16 bg = *(volatile u16 *)0x0400000e;
    int mode = (int)(*(volatile u32 *)0x04000000 & 0x7);
    if (mode >= 3) {
        if (mode >= 6)
            return 0;
        if (bg & 0x80)
            return 0;
    }
    return 0x6000000
         + (((*(volatile u32 *)0x04000000 & 0x7000000) >> 24) << 16)
         + (((u32)(bg & 0x3c) >> 2) << 14);
}
