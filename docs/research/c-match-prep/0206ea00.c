/* CAMPAIGN-PREP candidate for func_0206ea00 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     call writes locals; bswap16 (asr via int promo, >>8 operand-first) then bswap32; store-order
 *   risk:       The lt-tail returns func_0206c61c's own negative r0 (addlt;bxlt with r0 untouched), not a literal — coding 'return 0' is wrong; must be 'int r=func(...); if(r<0) return r;'. reshape-able. Also h>>8 needs asr: keep h as plain int-promoted (do NOT make it s16/ldrsh — orig uses ldrh).
 *   confidence: med
 */
/* func_0206ea00 (main, class D) — call fills two locals, then bswap16/bswap32 stores. */
typedef unsigned short u16;
typedef unsigned long  u32;

extern int func_0206c61c(void *a, void *outH, void *outW);

int func_0206ea00(void *a, void *dst)
{
    char *d = (char *)dst;
    u16   h;
    u32   w;

    if (func_0206c61c(a, &h, &w) < 0) {
        return 0; /* lt-tail: returns the negative r0 from func_0206c61c */
    }
    *(u16 *)(d + 0x2) = (u16)(((h >> 8) & 0xff) | ((h << 8) & 0xff00));
    *(u32 *)(d + 0x4) = ((w >> 24) & 0xff) | ((w >> 8) & 0xff00) |
                        ((w << 8) & 0xff0000) | (w << 24);
    return 0;
}
