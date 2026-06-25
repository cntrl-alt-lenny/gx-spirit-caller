/* CAMPAIGN-PREP candidate for func_02245cc8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch over the 12 decoded case values; *p short-circuit first
 *   risk:       Orig holds 0x17bc(r3) & 0x15ab(r2) live and derives neighbors as r2+-k (mla/sub) — a CSE/pivot-reuse pattern mwcc's switch-tree won't reproduce; tree shape + branch-order coin-flip. permuter-class (or hand-.s).
 *   confidence: low
 */
/* func_ov002_02245cc8 (cls C): *p==0x17bc OR arg1 in a sparse case set -> 1.
 * mwcc lowers the switch to a binary cmp-tree (the orig's nested cmp/bgt/blt). */
typedef unsigned short u16;

int func_ov002_02245cc8(u16 *p, int v) {
    if (*p == 0x17bc)
        return 1;
    switch (v) {
    case 0x14e6:
    case 0x15a7:
    case 0x15ab:
    case 0x183e:
    case 0x198f:
    case 0x19b7:
    case 0x1af8:
    case 0x1af9:
    case 0x1afa:
    case 0x1b02:
    case 0x1b03:
    case 0x1b04:
        return 1;
    }
    return 0;
}
