/* CAMPAIGN-PREP candidate for func_021e36b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: two bitfield extracts (6-bit guard, 2-bit tail) + switch
 *   risk:       permuter-class AND truncated-asm: the .s body is cut off (no literal pool / .L_13c / .L_148), so the switch case set and the .L_13c/.L_148 return values are guessed; the cmp-tree itself is also mwcc-shape sensitive.
 *   confidence: low
 */
/* func_ov002_021e36b8: bitfield guard then switch(id), then a 2-bit
 * bitfield tail. NOTE: source asm was TRUNCATED at .L_120 (literal pool
 * and .L_13c/.L_148 bodies absent); case constants and the two
 * non-.L_120 return values are RECONSTRUCTED, not byte-derived. */
typedef struct {
    unsigned short id;       /* +0x0 */
    unsigned short state2;   /* +0x2 bitfield container */
} Card021e36b8;

int func_ov002_021e36b8(Card021e36b8 *card) {
    unsigned int g = ((unsigned int)card->state2 << 20) >> 26; /* bits[11:6] */
    if (g == 0x22)
        return 0;
    switch (card->id) {
    /* .L_13c group */
    case 0:
        return 1;
    /* .L_120 group: result depends on bits[13:12]==2 */
    case 1: {
        unsigned int kind = ((unsigned int)card->state2 << 18) >> 30;
        return kind == 2 ? 1 : 0;
    }
    /* .L_148 default */
    default:
        return 0;
    }
}
