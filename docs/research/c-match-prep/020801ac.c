/* CAMPAIGN-PREP candidate for func_020801ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch on h4; case2 pointer binary-search; mid = lo+((hi-lo)/2 & ~1) to hit asr-by-8 magic; default 0xffff
 *   risk:       permuter-class: the case-2 midpoint is a signed divide-by-8-of-byte-diff (asr#1;+lsr30;asr2;+lsr31;asr1;lsl2). My &~1 pointer form likely won't reproduce that exact shift chain; expect scheduling/shift divergence.
 *   confidence: low
 */
/* func_020801ac: lookup mode (arg0->h4) selecting one of three index maps over
 * arg0, returning a u16 (default 0xffff). case0 linear offset, case1 direct table,
 * case2 binary search over {u16 key,u16 val}[count] at arg0+0xe (stride 4). */

typedef struct {
    unsigned short h0;     /* +0x00 base index */
    unsigned short h2;     /* +0x02 */
    unsigned short h4;     /* +0x04 mode */
    unsigned char  pad6[6];/* +0x06 */
    unsigned short hc;     /* +0x0c count */
    unsigned short e[1];   /* +0x0e entries: [key,val] pairs */
} Tbl;

unsigned short func_020801ac(Tbl *t, int x) {
    unsigned short r = 0xffff;
    switch (t->h4) {
    case 0:
        r = (unsigned short)(t->hc + (x - t->h0));
        break;
    case 1:
        r = *(unsigned short *)((char *)t + 0xc + ((x - t->h0) << 1));
        break;
    case 2: {
        unsigned short *lo = t->e;
        unsigned short *hi = t->e + ((t->hc - 1) << 1);
        if (lo <= hi) {
            for (;;) {
                unsigned short *mid = lo + (((hi - lo) >> 1) & ~1);
                if (mid[0] < x) {
                    lo = mid + 2;
                } else if (x < mid[0]) {
                    hi = mid - 2;
                } else {
                    r = mid[1];
                    break;
                }
                if (lo > hi) break;
            }
        }
        break;
    }
    }
    return r;
}
