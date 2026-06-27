/* CAMPAIGN-PREP candidate for func_020b3814 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/escape: orrs zero-tests as (a|b)==0; flag in r4; but two .word lines are data-as-code
 *   risk:       struct-guessed + escape-required: the body embeds two assembled .word instructions (a long-range bne into func_020b3658 and a bl to func_020b3a7c+8). No C produces those exact encodings/targets — this function must ship as .s; treat C as documentation only.
 *   confidence: low
 */
typedef unsigned int u32;

/* 64-bit divmod-step helper. Hand-written .s with data-as-code (.word bne/bl).
   r0=lo r1=hi r2=dlo r3=dhi. Returns remainder-ish in r0, r1 cleared.
   The two .word lines are a raw 'bne' into func_020b3658 and a raw 'bl'
   into func_020b3a7c+8 — NOT expressible as clean C; this TU only sketches
   the orrs/zero-test skeleton and WILL need an .s escape. */

extern u32 func_020b3a7c(u32 lo, u32 hi);

extern u32 func_020b3814(u32 lo, u32 hi, u32 dlo, u32 dhi);

u32 func_020b3814(u32 lo, u32 hi, u32 dlo, u32 dhi) {
    int flag = 1;
    u32 r;
    for (;;) {
        if ((dhi | dlo) == 0)
            return lo;            /* r0 returned as-is */
        if ((hi | dhi) != 0)
            break;                /* raw bne into func_020b3658 */
    }
    /* mov r1,r2 ; bl func_020b3a7c+8 */
    r = func_020b3a7c(dlo, hi);
    if (flag != 0)
        lo = r;
    return lo;
}
