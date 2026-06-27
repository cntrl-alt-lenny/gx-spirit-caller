/* CAMPAIGN-PREP candidate for func_0206b1f8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mla hash accum; signed-byte table guard; %div via divide helper remainder
 *   risk:       permuter-class: byte-identical clone of func_020685c8 which is already shipped as .s for being reg-alloc-walled; `mla ip,r2,ip,lr` accum-order, the ldrsb-post-index pointer walk, and h%div lowering to func_020b3a7c won't reliably fall out of C.
 *   confidence: low
 */
/* func_0206b1f8 — string hash (signed-byte, table-mapped 0..0x7f) reduced mod a
 * divisor; EXACT CLONE of func_020685c8 (which ships as hand .s, reg-alloc-walled).
 *   h = 0;
 *   for (c = *s; c != 0; c = *++s) {
 *       if (c >= 0 && c < 0x80) c = table[c];
 *       h = h * 0x9ccf9319 + c;
 *   }
 *   func_020b3a7c(h, div) -> (quotient r0, remainder r1); return remainder.
 * The divisor is the 2nd incoming arg (r1), preserved across the loop.
 */
typedef unsigned char u8;

extern u8 data_020c3654[];
extern unsigned int func_020b3a7c(unsigned int v, unsigned int d);

int func_0206b1f8(signed char *s, unsigned int div)
{
    unsigned int h = 0;
    signed char c = *s;
    while (c != 0) {
        int cc = c;
        if (c >= 0 && c < 0x80)
            cc = data_020c3654[c];
        h = h * 0x9ccf9319 + cc;
        c = *++s;
    }
    /* func_020b3a7c returns quotient in r0, remainder in r1; we want remainder. */
    return (int)(h % div);
}
