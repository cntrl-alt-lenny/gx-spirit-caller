/* CAMPAIGN-PREP candidate for func_021e381c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield guards (movs sets flags) + helper guards + switch
 *   risk:       permuter-class AND truncated-asm: tail cut at .L_288 so switch targets/returns are partial; also the 'cmp r0,#2;cmpne #3;cmpne #4' chain needs r==2||r==3||r==4 exactly and the cmp-tree is mwcc-shape sensitive.
 *   confidence: low
 */
/* func_ov002_021e381c: guard chain of early-returns then switch(id).
 * NOTE: asm truncated at .L_288 (the .L_288/.L_298 final returns and the
 * full case->target mapping are partly reconstructed). Two extern helpers
 * are queried with the id. */
extern int func_0202e234(int id);
extern int func_0202b8c0(int id);

typedef struct {
    unsigned short id;       /* +0x0 */
    unsigned short state2;   /* +0x2 bitfield container, bits[13:12] */
    unsigned short field4;   /* +0x4 bitfield container, bit3 */
} Card021e381c;

int func_ov002_021e381c(Card021e381c *card) {
    int r;
    if ((((unsigned int)card->state2 << 18) >> 30) != 0)   /* bits[13:12] */
        return 0;
    if ((((unsigned int)card->field4 << 28) >> 31) != 0)   /* bit3 */
        return 1;
    if (func_0202e234(card->id) != 0)
        return 0;
    r = func_0202b8c0(card->id);
    if (r == 2 || r == 3 || r == 4)
        return 0;
    switch (card->id) {
    /* .L_280 group returns 0 */
    case 5120: /* 0x1400 */
        return 0;
    /* .L_288 group / default: tail truncated */
    default:
        return 1;
    }
}
