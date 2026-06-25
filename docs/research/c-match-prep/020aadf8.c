/* CAMPAIGN-PREP candidate for func_020aadf8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     align-by-(addr&3) then magic-mask 0xfefefeff/0x80808080 word copy; pre-decr ptr
 *   risk:       the aligned loop does `str r5,[r2,#4]!` with r2 pre-subtracted by 4 (post-index write-back) and hoists r5 load past the test. mwcc's pointer-induction/load-scheduling rarely reproduces this exact pre-increment store form. permuter-class (loop reg-alloc + addressing-mode); align-prologue likely matches but the word loop is the wall.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020aadf8 (main, class D) - brief p_0053.
 * UNVERIFIED build-free draft. Classic MSL word-at-a-time strcpy.
 *   recipe:     0xfefefeff/0x80808080 magic-mask align loop; literal-pool word constants
 *   confidence: low (codegen of the unrolled aligned loop is mwcc-version sensitive)
 */
/* word-at-a-time strcpy(dst=r0, src=r1). Aligns by (addr&3), then copies words
 * testing (w + 0xfefefeff) & ~w & 0x80808080 for an embedded zero byte. */

char *func_020aadf8(char *dst, const char *src)
{
    char *d = dst;
    const char *s = src;

    if ((((unsigned int)s ^ (unsigned int)d) & 3) == 0) {
        unsigned int al = (unsigned int)s & 3;
        if (al != 0) {
            char c = *s;
            *d = c;
            if (c == 0) return dst;
            for (al = 3 - al; al != 0; al--) {
                c = *++s;
                *++d = c;
                if (c == 0) return dst;
            }
            d++; s++;
        }
        {
            const unsigned int *ws = (const unsigned int *)s;
            unsigned int w = *ws;
            if (((w + 0xfefefeffU) & ~w & 0x80808080U) == 0) {
                unsigned int *wd = (unsigned int *)(d - 4);
                do {
                    wd[1] = w; wd++;
                    w = *++ws;
                } while (((w + 0xfefefeffU) & ~w & 0x80808080U) == 0);
                d = (char *)(wd + 1);
            }
            s = (const char *)ws;
        }
    }
    {
        char c = *s;
        *d = c;
        if (c != 0)
            do { c = *++s; *++d = c; } while (c != 0);
    }
    return dst;
}
