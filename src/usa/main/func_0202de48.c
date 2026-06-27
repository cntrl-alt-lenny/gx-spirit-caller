/* CAMPAIGN-PREP candidate for func_0202de48 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dense switch returning constants -> cmp+addls branch-table (021ca618 recipe)
 *   risk:       dense 0..15 table is the proven idiom; only residual risk is mwcc emitting a separate default body vs the shared .L_114c mov #0 (reshape-able: keep explicit default 0)
 *   confidence: high
 */
/* func_0202de48: 16-case (0..15) dense switch on func_0202b884(), returning a
 * small constant per case (default 0). Compiles to cmp #0xf + addls pc,pc jump
 * table. Proven recipe: func_ov013_021ca538 (switch returning constants). */
extern int func_0202b884(void);

int func_0202de48(void) {
    switch (func_0202b884()) {
    case 0:  return 0;
    case 1:  return 1;
    case 2:  return 3;
    case 3:  return 3;
    case 4:  return 2;
    case 5:  return 2;
    case 6:  return 1;
    case 7:  return 1;
    case 8:  return 1;
    case 9:  return 0;
    case 10: return 4;
    case 11: return 5;
    case 12: return 6;
    case 13: return 7;
    case 14: return 8;
    case 15: return 9;
    default: return 0;
    }
}
