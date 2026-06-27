/* CAMPAIGN-PREP candidate for func_021c325c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id=lsl#19;lsr#19; call result `cmp #0; addne count`; reload rec+0x14 inside loop (not hoisted)
 *   risk:       reshape-able: orig RELOADS `ldr r0,[r6,#0x14]` every iteration (count not hoisted) and uses `addne r5` predication after the call; if mwcc hoists n or branches instead of predicating, the loop tail diverges. Keep n in the while-condition (reloads).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c325c (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     id(13b) lsl#19;lsr#19 extract; call func_0202e234(id); if !=0 count++; reload rec+0x14 each iter
 * func_021c325c(parity, _ignored): over rec[0x14] entries at rec+0x418, call
 * func_0202e234(entry.id) and count non-zero results. r1(arg1) is consumed only
 * by `and r0,r0,#1` on r0; arg1 itself is unused after. Count read reloaded in loop. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_ov002_0202e234(int id);

int func_ov002_021c325c(int parity) {
    int off = (parity & 1) * 0x868;
    int count = 0;
    if (*(int *)(data_ov002_022cf180 + off) != 0) {
        char *rec = data_ov002_022cf16c + off;
        unsigned int *p = (unsigned int *)(rec + 0x18 + 0x400);
        int i = 0;
        do {
            unsigned int e = *p;
            if (func_ov002_0202e234((int)((e << 19) >> 19)) != 0) count++;
            i++;
            p++;
        } while (i < *(int *)(rec + 0x14));
    }
    return count;
}
