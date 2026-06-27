/* CAMPAIGN-PREP candidate for func_0200a68c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield: (h<<28)>>28 & (h<<24)>>28 are :4 nibbles; insert into [7:4], store-order
 *   risk:       struct-guessed: the lsl#1c;lsr#1c and lsl#18;lsr#1c pairs are :4 bitfields at [3:0]/[7:4] — confirmed pattern, but the bic r3,#0xf0 read-modify-write of dst (NOT a clean bitfield store) may make mwcc emit and/orr instead of the bic; reshape dst write as explicit (g & ~0xf0) | (...) if bitfield store diverges.
 *   confidence: med
 */
extern unsigned short data_0210673c[];
extern unsigned short data_0210680c[];

struct nib { unsigned short lo : 4; unsigned short hi : 4; unsigned short rest : 8; };

int func_0200a68c(int bit)
{
    struct nib *src = (struct nib *)((char *)data_0210673c + 0xd0);
    int ret = 0;

    if (src->lo & (1 << bit)) {
        if (!(src->hi & (1 << bit)))
            ret = 1;
    }
    if (ret) {
        struct nib *dst = (struct nib *)data_0210680c;
        dst->hi |= 1 << bit;
    }
    return ret;
}
