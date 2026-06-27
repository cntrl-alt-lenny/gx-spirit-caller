/* CAMPAIGN-PREP candidate for func_020685c8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla accumulate = hash*MAGIC+c; signed-char loop; const-divisor folded; hi-word of 64-bit ret
 *   risk:       call site sets only r0 then uses r1 -> modeled func_020b3a7c as long long, taking the high word; if it is really a 2-word struct/divmod the r1 source-shape differs — struct-guessed.
 *   confidence: med
 */
/* func_020685c8 @ 0x020685c8  (cls D, main) — case-folding polynomial string hash,
   *0x9CCF9319 + char, table[c] fold for 0<=c<0x80, then post-process via func_020b3a7c
   which returns a 64-bit value; this fn returns its HIGH word (mov r0,ip;bl;mov r0,r1). */
typedef unsigned char u8;

extern const u8 data_020c3654[]; /* fold/canonicalize table */
extern long long func_020b3a7c(unsigned int x);

int func_020685c8(const signed char *s)
{
    unsigned int hash = 0;
    signed char c = *s;

    if (c != 0) {
        do {
            int fc = c;
            if (c >= 0 && c < 0x80) {
                fc = data_020c3654[c];
            }
            hash = hash * 0x9CCF9319u + fc;
            c = *++s;
        } while (c != 0);
    }
    return (int)(func_020b3a7c(hash) >> 32);
}
