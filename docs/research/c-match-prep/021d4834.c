/* CAMPAIGN-PREP candidate for func_021d4834 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload counter per store (separate global reads); strh order f0,f2,f4,f6; CS=unsigned >=
 *   risk:       same CSE hazard as 021d479c: orig reloads ce950[+0x808] before each strh; if mwcc CSEs the 4 reads into one reg the indexing collapses. reshape-able only via aliasing; otherwise permuter/.s.
 *   confidence: low
 */
/* func_ov002_021d4834: ov002 event-record arg-pack sink (lean sibling of
 * 021d479c, no cd73c guard, no 0229cd40 call). Guard counter>=0x100, fan 4
 * args out as halfwords into the 4 parallel u16 arrays, increment counter.
 * cls D: indexed strh fan-out, store-order + per-store counter RELOAD. */
#include "ov002_core.h"

extern unsigned short data_ov002_022ce958[];
extern unsigned short data_ov002_022ce95a[];
extern unsigned short data_ov002_022ce95c[];
extern unsigned short data_ov002_022ce95e[];

void func_ov002_021d4834(int a0, int a1, int a2, int a3) {
    if ((unsigned int)*(int *)(data_ov002_022ce950 + 0x808) >= 0x100)
        return;
    data_ov002_022ce958[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a0;
    data_ov002_022ce95a[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a1;
    data_ov002_022ce95c[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a2;
    data_ov002_022ce95e[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a3;
    *(int *)(data_ov002_022ce950 + 0x808) += 1;
}
