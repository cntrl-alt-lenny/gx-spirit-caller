/* CAMPAIGN-PREP candidate for func_021e2e38 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: two single-bit bitfields of the +2 u16 (lsl#11;lsr#31 and lsl#31;lsr#31); eor; cmp
 *   risk:       struct-guessed + bitfield-extract: orig reads ONE ldrh then does lsl#0x11;lsr#0x1f (bit1) and lsl#0x1f;lsr#0x1f (bit0-of-high? actually bit15) — mwcc may emit two ldrh or fold the eor of two :1 fields differently. permuter-class.
 *   confidence: low
 */
/* func_ov002_021e2e38 (leaf, no calls): 0 if (d016c+0xd0c)==0; else read arg0->f2
 * (u16 at +2), compute (bit1 ^ bit15) of it, and return 1 iff (cd73c+4) != that. */
#include "ov002_core.h"

extern char data_ov002_022cd73c[];
extern char data_ov002_022d016c[];

struct Self2e {
    unsigned short f0;
    unsigned short : 1;
    unsigned short bit1 : 1;
    unsigned short : 13;
    unsigned short bit15 : 1;
};

int func_ov002_021e2e38(struct Self2e *arg0) {
    int x;
    if (*(int *)(data_ov002_022d016c + 0xd0c) == 0)
        return 0;
    x = arg0->bit1 ^ arg0->bit15;
    return *(int *)(data_ov002_022cd73c + 4) != x;
}
