/* CAMPAIGN-PREP candidate for func_021e35ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 2-bit bitfield via (x<<18)>>30; switch returns small consts
 *   risk:       permuter-class: mwcc's binary-search switch tree (pivot order + add/sub-relative literal reuse like 'add r2,ip,#0x91') rarely matches unless the exact case set/order is reproduced; constants need objdiff tuning.
 *   confidence: low
 */
/* func_ov002_021e35ac: switch(card->id) into 3 groups; a 2-bit bitfield
 * (card->state2 bits[13:12]) selects the return for two of them.
 * .L_b4 group -> (kind!=2); .L_d8 (id 6800) -> (kind==2);
 * .L_d0 group -> 0; default -> 1. */
typedef struct {
    unsigned short id;       /* +0x0 */
    unsigned short state2;   /* +0x2 bitfield container */
} Card021e35ac;

int func_ov002_021e35ac(Card021e35ac *card) {
    unsigned int kind = ((unsigned int)card->state2 << 18) >> 30; /* bits[13:12] */
    switch (card->id) {
    case 4923: case 4468:
        return 0;
    case 6380: case 5189: case 6089: case 6092:
    case 6410: case 6525: case 6696:
        return kind != 2 ? 1 : 0;
    case 6800:
        return kind == 2 ? 1 : 0;
    default:
        return 1;
    }
}
