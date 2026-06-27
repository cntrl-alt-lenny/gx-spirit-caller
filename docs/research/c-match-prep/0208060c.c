/* CAMPAIGN-PREP candidate for func_0208060c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hi=(pal<<28)>>16 (two-shift, unsigned->lsr); orr hi|val (hi first); strh post-inc *p++; val not reset per row; dst+=stride hoists stride*2
 *   risk:       reshape-able: (pal<<28)>>16 may fold to and+lsl instead of lsl#28;lsr#16 — if so use a :4 bitfield or keep literal shifts. Also dst+=stride must hoist to lr=stride<<1.
 *   confidence: med
 */
/* func_0208060c: 2D tilemap fill, palette nibble OR running counter. */
void func_0208060c(unsigned short *dst, int width, int height, int stride,
                   unsigned int val, unsigned int pal) {
    unsigned int hi = (pal << 28) >> 16;   /* (pal & 0xf) << 12 via lsl#28;lsr#16 */
    int row;
    if (height <= 0) return;
    for (row = 0; row < height; row++) {
        unsigned short *p = dst;
        int col;
        for (col = 0; col < width; col++) {
            *p++ = (unsigned short)(hi | val);
            val++;
        }
        dst += stride;
    }
}
