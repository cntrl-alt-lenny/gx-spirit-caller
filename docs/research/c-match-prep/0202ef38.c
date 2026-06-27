/* CAMPAIGN-PREP candidate for func_0202ef38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D switch->membership; dense window -> pl jump-table, ascending order
 *   risk:       orig spans the dense 0x1961-0x1973 cluster as a 19-entry pl table; mwcc's density heuristic must agree to table vs chain that run. Tail pivot 0x1b3e split also structural. permuter-class (switch shape).
 *   confidence: med
 */
/* func_0202ef38: card-id membership test (switch -> 1, default 0).
 * 19-entry pl jump-table for the dense 0x1961..0x1973 window plus a
 * compare tree around pivot 0x1b3e for the 0x1b3d..0x1b5a tail. */
int func_0202ef38(int a0) {
    switch (a0) {
    case 0x1961:
    case 0x1965:
    case 0x1966:
    case 0x1967:
    case 0x1968:
    case 0x1969:
    case 0x196a:
    case 0x1970:
    case 0x1973:
    case 0x1b3d:
    case 0x1b3e:
    case 0x1b3f:
    case 0x1b5a:
        return 1;
    }
    return 0;
}
