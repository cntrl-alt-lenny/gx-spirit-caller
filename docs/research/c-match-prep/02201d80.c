/* CAMPAIGN-PREP candidate for func_02201d80 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: +2 and +0x14 bitfield structs; kind eq -> two beq targets; w_bit == cb0 -> moveq bool branch-tail
 *   risk:       struct-guessed: +0x14 bit21/bit16 assignments inferred. reshape-able if a bit lands wrong. Minor: the two kind compares may merge into a switch jump-table vs the cmp;beq;cmp;beq the asm shows.
 *   confidence: med
 */
/* func_ov002_02201d80 (ov002, class D) - kind switch (0xf/0x10) + word-bit == halfword-bit0 branch-tail bools, no calls.
 * +0x14 word read as bitfield struct: kind 0xf tests bit21, kind 0x10 tests bit16, both vs cb0. */
typedef struct {
    unsigned short id0;
    unsigned short cb0  : 1;
    unsigned short cf5  : 5;
    unsigned short kind : 6;
    unsigned short cf12 : 2;
    unsigned short cb14 : 1;
    unsigned short cb15 : 1;
    unsigned char pad4[0x10];
    unsigned int w_0_15  : 16;
    unsigned int w_b16   : 1;
    unsigned int w_17_20 : 4;
    unsigned int w_b21   : 1;
} Card;

int func_ov002_02201d80(Card *c) {
    int kind = c->kind;
    if (kind == 0xf) {
        if (c->w_b21 == (unsigned int)c->cb0) return 1;
        return 0;
    }
    if (kind == 0x10) {
        if (c->w_b16 == (unsigned int)c->cb0) return 1;
        return 0;
    }
    return 0;
}
