/* CAMPAIGN-PREP candidate for func_02085460 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: mla stride index; bic 0xf + orr val (4-bit field at bit0)
 *   risk:       struct-guessed: same reconstructed `mla` 2D index as the 0208541c clone; if base/offset inference is off the mla operands reorder. The `bic #0xf; orr r2` insert (no shift) is low-risk.
 *   confidence: med
 */
/* func_02085460: clone of func_0208541c but inserts a 4-bit field at bit0 of
 * word +0xc (bic #0xf; orr val). r0=obj, r1=index, r2=value(4 bits). */

int func_02085460(unsigned char *obj, int idx, int val)
{
    unsigned char *blk = obj + *(int *)(obj + 0x8);
    unsigned short k = *(unsigned short *)(blk + 0xa);
    unsigned char *tab = blk + 4;
    unsigned short stride = *(unsigned short *)(tab + k);
    int off = *(int *)((unsigned char *)(tab + k) + stride * idx + 0x4);
    unsigned char *row = blk + off;
    unsigned int w = *(unsigned int *)(row + 0xc);
    w = (w & ~0xf) | val;
    *(unsigned int *)(row + 0xc) = w;
    return 0;
}
