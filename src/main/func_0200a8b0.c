/* CAMPAIGN-PREP candidate for func_0200a8b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield clone of a68c: +0xd2 src, 0210680e dst; :4 nibble test+insert, store-order
 *   risk:       struct-guessed: byte-exact clone of a68c (only src offset 0xd0->0xd2 and dst 0210680c->0210680e differ). Same bic #0xf0 RMW-vs-bitfield-store risk; if a68c needs the explicit (g & ~0xf0)|(...) reshape, apply identically here.
 *   confidence: med
 */
extern unsigned short data_0210673c[];
extern unsigned short data_0210680e[];

struct nib { unsigned short lo : 4; unsigned short hi : 4; unsigned short rest : 8; };

int func_0200a8b0(int bit)
{
    struct nib *src = (struct nib *)((char *)data_0210673c + 0xd2);
    int ret = 0;

    if (src->lo & (1 << bit)) {
        if (!(src->hi & (1 << bit)))
            ret = 1;
    }
    if (ret) {
        struct nib *dst = (struct nib *)data_0210680e;
        dst->hi |= 1 << bit;
    }
    return ret;
}
