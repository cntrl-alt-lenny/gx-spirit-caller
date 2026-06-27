/* CAMPAIGN-PREP candidate for func_021ceebc (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base403c; conditional-lsl + shared-lsr (not bitfield); exact store-order
 *   risk:       permuter-class: orig shares ONE ldr+lsr#28 with a conditional lsl(23/19); mwcc likely splits into two per-branch loads/shifts. Also tbl/x/y reg rotation across 6 stores.
 *   confidence: low
 */
/* func_ov011_021ceebc (ov011, cls D): pick a short[] pair-table by a
 * bitfield of base403c+0x268, conditioned on base4000+0x2a0==1. The orig
 * loads +0x268 ONCE then uses a CONDITIONAL shift amount (lsl#23 vs lsl#19)
 * with a SHARED lsr#28 -- so this is NOT two bitfields; it is one word with
 * ternary-selected shift. Table entry = 4 bytes = 2 shorts (x,y); both <<12.
 * Store order EXACT: 0x21c,0x220,0x218,0x270,0x230,0x234. base403c bound. */

extern char data_ov011_021d300c[];
extern char data_ov011_021d3034[];
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];

void func_ov011_021ceebc(void) {
    char         *b   = data_ov011_021d403c;
    unsigned int  v   = *(unsigned int *)(b + 0x268);
    short        *tbl;
    unsigned int  idx;
    int           x, y;
    unsigned int  m;

    if (*(int *)(data_ov011_021d4000 + 0x2a0) == 1) {
        tbl = (short *)data_ov011_021d300c;
        idx = (v << 0x17) >> 0x1c;   /* bits [8:5] */
    } else {
        tbl = (short *)data_ov011_021d3034;
        idx = (v << 0x13) >> 0x1c;   /* bits [12:9] */
    }
    idx -= 1;

    x = tbl[idx * 2] << 0xc;
    m = *(unsigned int *)(b + 0x270);
    *(int *)(b + 0x21c) = x;
    y = tbl[idx * 2 + 1] << 0xc;
    m &= ~0x20000;
    *(int *)(b + 0x220) = y;
    *(int *)(b + 0x218) = 0x1000;
    *(int *)(b + 0x270) = m;
    *(int *)(b + 0x230) = x;
    *(int *)(b + 0x234) = y;
}
