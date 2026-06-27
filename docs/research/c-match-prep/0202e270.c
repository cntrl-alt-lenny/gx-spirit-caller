/* CAMPAIGN-PREP candidate for func_0202e270 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dense 0..12 switch->cmp+addls branch-table, two shared return bodies
 *   risk:       proven dense-table idiom; risk is mwcc ordering the two return-bodies (mov#1 .L_48 / mov#0 .L_50) — asm puts member(1) first, matches case-before-default source order (reshape-able)
 *   confidence: high
 */
/* func_0202e270: 13-case (0..12) dense switch on func_0202b8d8() mapping to 0/1
 * (members {2,4,6,7,8,9,11,12}); default 0. cmp #0xc + addls pc,pc jump table.
 * Recipe: switch-returning-constants -> branch-table (func_ov013_021ca618). */
extern int func_0202b8d8(void);

int func_0202e270(void) {
    switch (func_0202b8d8()) {
    case 2:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 12:
        return 1;
    default:
        return 0;
    }
}
