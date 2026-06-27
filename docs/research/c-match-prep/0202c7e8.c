/* CAMPAIGN-PREP candidate for func_0202c7e8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield pack ((lo&m)|((hi<<16)&(m<<16))) replicated per-case via branch table
 *   risk:       each case must reload _LIT0 mask and recompute the and/and/orr in the SAME order (mov r3,m<<16; and r1; and r0; orr) — but mwcc will likely hoist the invariant pack ONCE before the switch instead of per-case, collapsing 8 identical blocks. To match the duplicated bodies the pack must NOT be hoisted: permuter-class / may need per-case inline.
 *   confidence: low
 */
// func_0202c7e8 — pack two 9-bit fields and store to one of 8 globals by selector.
// value = (lo & 0x1ff) | ((hi << 16) & (0x1ff << 16)); written to gN per case.
// cases 0..8 with case 0 and 5 = no-op (bx lr); 1->g1,2->g2,3->g3,4->g4,6->g5,7->g6,8->g7,9? .
extern volatile unsigned int data_g1;  // _LIT1
extern volatile unsigned int data_g2;  // _LIT2
extern volatile unsigned int data_g3;  // _LIT3
extern volatile unsigned int data_g4;  // _LIT4
extern volatile unsigned int data_g5;  // _LIT5
extern volatile unsigned int data_g6;  // _LIT6
extern volatile unsigned int data_g7;  // _LIT7
extern volatile unsigned int data_g8;  // _LIT8

void func_0202c7e8(int sel, unsigned int lo, unsigned int hi)
{
    unsigned int packed = (lo & 0x1ff) | ((hi << 16) & (0x1ffu << 16));
    switch (sel) {
    case 1: data_g1 = packed; break;
    case 2: data_g2 = packed; break;
    case 3: data_g3 = packed; break;
    case 4: data_g4 = packed; break;
    case 6: data_g5 = packed; break;
    case 7: data_g6 = packed; break;
    case 8: data_g7 = packed; break;
    default: break;  /* sel 0,5,>8 -> bx lr; LIT8/g8 case is unreached idx9 */
    }
}
