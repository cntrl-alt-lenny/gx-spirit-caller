/* CAMPAIGN-PREP candidate for func_020a7480 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order word-unroll; head/tail byte loops; bind packed byte to one reg
 *   risk:       The b=b|w reuse of the byte reg (r3 stays live as both byte and word splat) is fragile; if mwcc allocates a fresh reg for the splat the strb/str source diverges. reshape-able (keep splat folding into same local b).
 *   confidence: low
 */
#include <stddef.h>

void *func_020a7480(unsigned char *dst, int c, unsigned int n)
{
    unsigned char b = (unsigned char)c;
    unsigned int w;
    unsigned int head;
    unsigned int blocks;
    unsigned int tail4;
    unsigned int tail;

    if (n >= 0x20) {
        head = (unsigned int)(-(int)dst) & 0x3;
        if (head != 0) {
            n -= head;
            do {
                *dst++ = b;
            } while (--head != 0);
        }
        if (b != 0) {
            w = (b << 16);
            w |= (b << 24);
            w |= (b << 8);
            b = b | w;
        }
        w = (unsigned int)b;
        blocks = n >> 5;
        if (blocks != 0) {
            do {
                ((unsigned int *)dst)[0] = w;
                ((unsigned int *)dst)[1] = w;
                ((unsigned int *)dst)[2] = w;
                ((unsigned int *)dst)[3] = w;
                ((unsigned int *)dst)[4] = w;
                ((unsigned int *)dst)[5] = w;
                ((unsigned int *)dst)[6] = w;
                ((unsigned int *)dst)[7] = w;
                dst += 0x20;
            } while (--blocks != 0);
        }
        tail4 = (n & 0x1f) >> 2;
        if (tail4 != 0) {
            do {
                *(unsigned int *)dst = w;
                dst += 4;
            } while (--tail4 != 0);
        }
        n &= 0x3;
    }
    if (n != 0) {
        do {
            *dst++ = b;
        } while (--n != 0);
    }
    return dst;
}
