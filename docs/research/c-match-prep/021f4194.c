/* CAMPAIGN-PREP candidate for func_021f4194 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch over card ids; dense 0x1610-0x161a span should trigger mwcc addls-pc jump table
 *   risk:       orig splits into an addls-pc jump table over (v-0x1610) for 0..10 AND outer compare branches; mwcc must pick the SAME 0x1610 base and 11-entry table width and the same tree for the outliers. The table base/width and tree pivots are not C-controllable. permuter-class
 *   confidence: low
 */
/* func_ov002_021f4194: classify a u16 id at [arg0] against card-id constants,
 * returning 1, 2, 3, 0xa, or 0. The orig uses a real jump table
 * (addls pc) for the dense 0x1610..0x161a cluster plus a compare tree. */
typedef unsigned short u16;

int func_ov002_021f4194(u16 *p) {
    switch (*p) {
    case 0x128e: return 1;
    case 0x1610: return 3;
    case 0x1611: return 3;
    case 0x1615: return 2;
    case 0x1617: return 1;
    case 0x161a: return 3;
    case 0x162d: return 0xa;
    case 0x1631: return 2;
    case 0x1634: return 2;
    case 0x1695: return 3;
    default:     return 0;
    }
}
