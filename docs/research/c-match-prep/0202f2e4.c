/* CAMPAIGN-PREP candidate for func_0202f2e4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D switch->membership; dense 18ef-window pl table + cmp-tree, ascending
 *   risk:       Uses r3 (not r2) as the held base (ldr r3,_LIT0) for the 0x1a50.. cluster offsets; mwcc must keep that base in one reg across 4 add-derived compares. If it reloads, ldr diverge. permuter-class (reg held across tree).
 *   confidence: med
 */
/* func_0202f2e4: card-id membership test (switch -> 1, default 0).
 * 14-entry pl jump-table over the 0x18ef..0x18fb window (true at
 * 0x18ef..0x18f5,0x18fa,0x18fb) plus a compare tree around pivot 0x1a52
 * for the scattered 0x1a50..0x1a5c cases and the lone 0x157b / 0x19f4. */
int func_0202f2e4(int a0) {
    switch (a0) {
    case 0x157b:
    case 0x18ef:
    case 0x18f0:
    case 0x18f1:
    case 0x18f2:
    case 0x18f3:
    case 0x18f4:
    case 0x18f5:
    case 0x18fa:
    case 0x18fb:
    case 0x19f4:
    case 0x1a50:
    case 0x1a52:
    case 0x1a53:
    case 0x1a56:
    case 0x1a58:
    case 0x1a59:
    case 0x1a5c:
        return 1;
    }
    return 0;
}
