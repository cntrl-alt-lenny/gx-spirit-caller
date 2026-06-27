/* CAMPAIGN-PREP candidate for func_0228db98 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla parity*0x868+base, then idx*0x14 offset; (w>>8)&1 test; idx<=4 as if-assign add
 *   risk:       reshape-able: mla ordering — orig does mul idx*0x14 first then mla parity (mla r0,lr,r2,ip). If mwcc fuses idx*0x14 into the mla, swap so parity*0x868 binds first.
 *   confidence: med
 */
// func_ov002_0228db98 — ov002 class D: mla index + lsr/tst bit test, small leaf
#include <stddef.h>

struct Ent20 { unsigned int f0; /* bit8 tested via >>8 & 1 */ };

// 2D table: [parity*0x868 + idx*0x14], base = data_ov002_022cf1ac
extern unsigned char data_ov002_022cf1ac[];

int func_ov002_0228db98(unsigned int a0, int idx)
{
    unsigned char *base = data_ov002_022cf1ac + (a0 & 1) * 0x868;
    unsigned int w = *(unsigned int *)(base + idx * 0x14);
    if ((w >> 8) & 1) return 0;
    return (idx <= 4 ? 1 : 0) + 1;
}
