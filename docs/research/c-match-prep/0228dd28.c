/* CAMPAIGN-PREP candidate for func_0228dd28 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla parity then idx*0x14+0x30; (w<<19)>>19 :13 field; cmp==const; const-subtract rsb-style
 *   risk:       reshape-able: orig holds key (lsr#0x13 result) in r0 across the cmp and the call arg; the cmp 0x17de uses lsr result before key recompute. If mwcc recomputes the shift, add a temp. Low divergence risk.
 *   confidence: med
 */
// func_ov002_0228dd28 — ov002 class D: mla index + bitfield extract + subtract, leaf
#include <stddef.h>

extern unsigned char data_ov002_022cf16c[]; // 2D base, parity stride 0x868
extern int func_0202b8f0(unsigned int key);

int func_ov002_0228dd28(unsigned int a0, int idx)
{
    unsigned char *base = data_ov002_022cf16c + (a0 & 1) * 0x868;
    unsigned int w = *(unsigned int *)(base + idx * 0x14 + 0x30);
    unsigned int key = (w << 0x13) >> 0x13;   // :13 unsigned field
    if (key == 0x17de) return 0x4e20;
    return 0x2710 - func_0202b8f0(key);
}
