/* CAMPAIGN-PREP candidate for func_022004c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: both +2 and +0x14 as bitfield structs; rsb (1-cb0) via subtract; bxne branch-tail returns
 *   risk:       struct-guessed: +0x14 bitfield bit assignments (bit9 vs bit15 vs bit14) inferred. reshape-able if a slice lands wrong. The rsb r0,r0,#1 then cmp expects (1-cb0); mwcc could emit eor instead.
 *   confidence: med
 */
/* func_ov002_022004c8 (ov002, class D) - kind gate then 3 word-bit branch-tail bools, no calls.
 * +0x14 word read as its own bitfield struct so each lsl;lsr maps to a member (bit9,bit14,bit15). */
typedef struct {
    unsigned short id0;
    unsigned short cb0  : 1;
    unsigned short cf5  : 5;
    unsigned short kind : 6;
    unsigned short cf12 : 2;
    unsigned short cb14 : 1;
    unsigned short cb15 : 1;
    unsigned char pad4[0x10];
    unsigned int w_0_9   : 9;
    unsigned int w_b9    : 1;
    unsigned int w_10_13 : 4;
    unsigned int w_b14   : 1;
    unsigned int w_b15   : 1;
} Card;

int func_ov002_022004c8(Card *c) {
    if (c->kind != 0xb) return 0;
    if (c->w_b9 != (unsigned int)(1 - c->cb0)) return 0;
    if (c->w_b15 == 0) return 0;
    return c->w_b14;
}
