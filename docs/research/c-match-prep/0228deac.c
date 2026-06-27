/* CAMPAIGN-PREP candidate for func_0228deac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla parity+0x120, [idx*4]; two shift-extracts combined; add operand-order hi+lo (acc first)
 *   risk:       reshape-able: orig computes hi=(v<<2)>>24<<1 in r1 and lo=(v<<18)>>31 in r2, then add r1,r1,r2 — hi must be the accumulator (first add operand). Write hi+lo not lo+hi.
 *   confidence: med
 */
// func_ov002_0228deac — ov002 class D: mla base + multi-shift bitfield pack, leaf
#include <stddef.h>

extern unsigned char data_ov002_022cf16c[]; // base; +0x120 then [idx*4]
extern void func_ov002_021c38c4(unsigned int a0, unsigned int packed);

void func_ov002_0228deac(unsigned int a0, int idx)
{
    unsigned char *base = data_ov002_022cf16c + (a0 & 1) * 0x868 + 0x120;
    unsigned int v = *(unsigned int *)(base + idx * 4);
    // r1 = ((v<<2)>>0x18) << 1  +  (v<<0x12)>>0x1f
    unsigned int hi = ((v << 0x2) >> 0x18) << 1;     // bits[29:22] *2
    unsigned int lo = (v << 0x12) >> 0x1f;           // bit13
    func_ov002_021c38c4(a0, hi + lo);
}
