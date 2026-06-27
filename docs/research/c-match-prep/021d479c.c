/* CAMPAIGN-PREP candidate for func_021d479c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload counter per store (separate global reads, no idx local); strh order f0,f2,f4,f6; CS=unsigned >=
 *   risk:       mwcc may CSE the 4 identical `*(int*)(ce950+0x808)` reads into one reg (orig RELOADS each — ldr lr,[+0x808] x4). If CSE'd, 4 ldr collapse to 1 and indexing diverges. reshape-able only if mwcc honors aliasing; else permuter/.s.
 *   confidence: low
 */
/* func_ov002_021d479c: ov002 event-record arg-pack SINK. Guards (cd73c[+8]==3
 * or counter ce950[+0x808]>=0x100 -> early return), then fans the 4 args out
 * as halfwords into 4 parallel u16 arrays (stride 8 = one 8-byte record per
 * idx), runs 0229cd40 on &record[idx], then increments the counter.
 * cls D: indexed strh fan-out, store-order + per-store counter RELOAD. */
#include "ov002_core.h"

extern int  data_ov002_022cd73c[];   /* +8 guard (==3 abort) */
extern unsigned short data_ov002_022ce958[];  /* record.f0 array, stride 8 bytes */
extern unsigned short data_ov002_022ce95a[];  /* record.f2 */
extern unsigned short data_ov002_022ce95c[];  /* record.f4 */
extern unsigned short data_ov002_022ce95e[];  /* record.f6 */
extern void func_ov002_0229cd40(void *rec);

void func_ov002_021d479c(int a0, int a1, int a2, int a3) {
    if (data_ov002_022cd73c[2] == 3)
        return;
    if ((unsigned int)*(int *)(data_ov002_022ce950 + 0x808) >= 0x100)
        return;
    /* separate re-reads of the counter => the orig's per-store ldr reload. */
    data_ov002_022ce958[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a0;
    data_ov002_022ce95a[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a1;
    data_ov002_022ce95c[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a2;
    data_ov002_022ce95e[*(int *)(data_ov002_022ce950 + 0x808) * 4] = (unsigned short)a3;
    func_ov002_0229cd40((char *)data_ov002_022ce958
        + *(int *)(data_ov002_022ce950 + 0x808) * 8);
    *(int *)(data_ov002_022ce950 + 0x808) += 1;
}
