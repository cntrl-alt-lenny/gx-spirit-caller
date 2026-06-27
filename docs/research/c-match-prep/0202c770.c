/* CAMPAIGN-PREP candidate for func_0202c770 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch-returning-constants -> addls pc,pc branch table; case 0 first
 *   risk:       table emits one 'b' slot per index 0..9; mwcc must place case5 and default both at the shared .L_70 (mov r0,#0) and keep the trailing idx9 .L_68 slot. If it dedups returns or reorders bodies, jump-table layout diverges. reshape-able (explicit ascending cases).
 *   confidence: med
 */
// func_0202c770 — map a small selector to a bit constant (jump-table returning constants).
// cases: 1->1, 2->2, 3->4, 4->8, 5->0, 6->1, 7->2, 8->4; default(0,>8)->0.
int func_0202c770(int sel)
{
    switch (sel) {
    case 1: return 1;
    case 2: return 2;
    case 3: return 4;
    case 4: return 8;
    case 5: return 0;
    case 6: return 1;
    case 7: return 2;
    case 8: return 4;
    default: return 0;
    }
}
