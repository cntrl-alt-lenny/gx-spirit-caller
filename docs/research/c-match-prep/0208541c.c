/* CAMPAIGN-PREP candidate for func_0208541c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: mla stride index; bic 0xc0 + orr (val<<6) field insert at bit6
 *   risk:       struct-guessed: the `mla r0,r3,r1,r0` (base = tab+k, +stride*idx, +4) indexing is reconstructed; if the inferred base/offset differs the mla operands reorder. The bic/orr<<6 insert itself is low-risk.
 *   confidence: med
 */
/* func_0208541c: indexed table walk (mla stride), then insert a 2-bit field
 * at bit6 of word +0xc. r0=obj, r1=index, r2=value(2 bits). obj->8 is a
 * sub-offset; obj+off+0xa is a u16 base index into a stride table at +4. */

int func_0208541c(unsigned char *obj, int idx, int val)
{
    unsigned char *blk = obj + *(int *)(obj + 0x8);
    unsigned short k = *(unsigned short *)(blk + 0xa);
    unsigned char *tab = blk + 4;
    unsigned short stride = *(unsigned short *)(tab + k);
    int off = *(int *)((unsigned char *)(tab + k) + stride * idx + 0x4);
    unsigned char *row = blk + off;
    unsigned int w = *(unsigned int *)(row + 0xc);
    w = (w & ~0xc0) | (val << 6);
    *(unsigned int *)(row + 0xc) = w;
    return 0;
}
