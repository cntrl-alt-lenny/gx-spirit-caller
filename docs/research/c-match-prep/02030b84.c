/* CAMPAIGN-PREP candidate for func_02030b84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     INVERTED polarity: matched cases return 0, default return 1; pure cmp-tree
 *   risk:       Polarity inversion is load-bearing (.L_654=0 is the match target, .L_65c=1 default) -- already encoded. Residual: pure-tree pivot/balance + base offset signs. Polarity is reshape-able (confirmed); tree shape is permuter-class.
 *   confidence: med
 */
/* func_02030b84: INVERTED card-id membership test.
 * Unlike its siblings the matched cases fall through to `mov r0,#0`
 * (.L_654) and the default tail is `mov r0,#1` (.L_65c) -- so the C is
 * `switch{case..: return 0;} return 1;`. Binary-search tree over pivot
 * 0x1954 with lit-base +/-offset derivations; pairs/triples at
 * 0x15f9/0x15fa, 0x1953/0x1954, 0x1a6d..0x1a6f, 0x1b4c..0x1b4e. */
int func_02030b84(int a0) {
    switch (a0) {
    case 0x15b1:
    case 0x15b4:
    case 0x15f9:
    case 0x15fa:
    case 0x1953:
    case 0x1954:
    case 0x1a6d:
    case 0x1a6e:
    case 0x1a6f:
    case 0x1b4c:
    case 0x1b4d:
    case 0x1b4e:
        return 0;
    }
    return 1;
}
