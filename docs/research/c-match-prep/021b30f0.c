/* CAMPAIGN-PREP candidate for func_021b30f0 (ov015, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D/C: shifted-or operand-first (val | attr<<12) picks dest; halfword post-inc store; row pointer advanced by (0x20-w)<<1; leading h<=0 early ldmle return.
 *   risk:       reshape-able: inner-loop increments both dst (post-inc) and val; if mwcc hoists (val|attr<<12) invariant-wrongly it would diverge, but val changes so it recomputes. Main hazard is rowstep r2 held across rows — bind once (shown). Possible permuter-class reg rotation on r5/r6.
 *   confidence: low
 */
/* func_ov015_021b30f0: after a setup call, fill a rect of a tilemap. dims read from a
 * 4-short header (cols at +0, base at +2, w at +4, h at +6). Each cell = (val | (attr<<12)),
 * written as halfword; rows stride (0x20 - w) cells. Early-out when h<=0. */
extern int func_ov015_021b2b80(void);

struct hdr015 { short base; short col; short w; short h; };  /* +0,+2,+4,+6 */

void func_ov015_021b30f0(int a0, struct hdr015 *hd, int val, int attr)
{
    short *dst;
    int h = hd->h;
    int w;
    int rowstep;
    int y;
    int base = func_ov015_021b2b80();

    dst = (short *)(base + ((hd->base + (hd->col << 5)) << 1));
    w = hd->w;
    if (h <= 0) return;
    rowstep = 0x20 - w;
    for (y = 0; y < h; y++) {
        int x = 0;
        while (x < w) {
            *dst++ = (short)(val | (attr << 12));
            x++;
            val++;
        }
        dst += rowstep;
    }
}
