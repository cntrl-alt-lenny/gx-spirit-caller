/* CAMPAIGN-PREP candidate for func_021e2bd4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: global guard chain; branch-order via early-returns; r1 of sink = 0xa-0xb (-1)
 *   risk:       reshape-able? control-flow: orig SHARES the .L_38 fall-through label between the 'd0c==0' and 'lookup!=2' branches; an && may make mwcc duplicate the counter block or invert branch polarity. Reshape via explicit goto if so.
 *   confidence: med
 */
/* func_ov002_021e2bd4: guard chain on ce288/d016c state; on the fall-through path
 * bump ce288+0x5cc and (when it was 0) ce288+0x5d0; on the .L_60 path post an
 * event via func_ov002_021b1570(0xa, -1, &out, 2) with out[0]=2. Early-out when
 * ce288+0x5d8 != 0. */
#include "ov002_core.h"

extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern int  data_ov002_022cd744[];

void func_ov002_021e2bd4(void) {
    int t;
    unsigned short out;
    if (*(int *)(data_ov002_022ce288 + 0x5d8) != 0)
        return;
    if (*(int *)(data_ov002_022d016c + 0xd0c) != 0 &&
        data_ov002_022cd744[*(int *)(data_ov002_022d016c + 0xcec)] == 2) {
        out = 2;
        func_ov002_021b1570(0xa, 0xa - 0xb, &out, 2);
        return;
    }
    t = *(int *)(data_ov002_022ce288 + 0x5cc);
    *(int *)(data_ov002_022ce288 + 0x5cc) = t + 1;
    if (t != 0)
        return;
    *(int *)(data_ov002_022ce288 + 0x5d0) += 1;
}
