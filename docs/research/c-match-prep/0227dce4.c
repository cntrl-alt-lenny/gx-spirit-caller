/* CAMPAIGN-PREP candidate for func_0227dce4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse switch on signed int -> compare-BST returns 1/0; pivot 0x1958
 *   risk:       mwcc may pick a different BST pivot/branch shape than orig (root 0x1958, sub/add-immediate probes); if so the tree order diverges. reshape-able (case-set fixed; tweak signedness/order)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0227dce4 (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. Literals ARE known (0x1958/0x1505/0x1a79).
 *   recipe:     sparse switch on signed int returns bool 1/0; mwcc builds compare-BST (pivot 0x1958)
 *   confidence: med
 */
/* func_ov002_0227dce4 (cls D) — return (a in {0x1505,0x1644,0x186c,0x1958,
 * 0x19c1,0x1a4e,0x1a79}) ? 1 : 0. Signed compares (bgt/bge); mwcc emits a
 * balanced compare tree rooted at 0x1958 with +/- immediate offsets. */

int func_ov002_0227dce4(int a) {
    switch (a) {
    case 0x1505:
    case 0x1644:
    case 0x186c:
    case 0x1958:
    case 0x19c1:
    case 0x1a4e:
    case 0x1a79:
        return 1;
    }
    return 0;
}
