/* CAMPAIGN-PREP candidate for func_02065dc0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed htons (asr) into stack block; constant tag byte; pass block ptr + stack args
 *   risk:       the exact 7-arg shuffle into func_02054ca8 (which sp slots get d/b/0/e/8/0) is reconstructed from str offsets and is the main divergence; reshape-able by reordering the call args. htons swap itself is low-risk.
 *   confidence: med
 */
/* func_02065dc0: thin marshaller — byteswap a halfword (signed htons) into
 * a small stack arg block alongside two constant tag bytes and a 5th stack
 * arg, then tail into func_02054ca8. */

extern int func_02054ca8(int a, int b, void *p, int z, int c, int d, int e);

int func_02065dc0(int a, int b, int half, int d, int e)
{
    unsigned char blk[8];   /* sp+0x8 region: [9]=tag, [a..b]=swapped half */
    int hh = half;

    blk[1] = 2;             /* strb lr(=2),[sp,#0x9] */
    *(short *)(blk + 2) = (short)(((hh >> 8) & 0xff) | ((hh << 8) & 0xff00));

    return func_02054ca8(d, b, blk, 0, e, 8, 0);
}
