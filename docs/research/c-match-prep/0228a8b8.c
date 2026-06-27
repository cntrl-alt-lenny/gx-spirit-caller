/* CAMPAIGN-PREP candidate for func_0228a8b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/range: set-membership as switch returning 1 (default 0) so mwcc emits the cmp/bgt/bge binary-search tree; values lifted straight from the tree leaves
 *   risk:       orig builds bounds by add/sub off 4 pool anchors (e.g. sub #0x1e, add #0x23) rather than 9 distinct literals, and the tree's split points/branch order are mwcc's own. permuter-class/structural: switch logic is right but the exact compare sequence + reused-anchor arithmetic likely won't reproduce.
 *   confidence: low
 */
/* func_ov002_0228a8b8 (ov002, cls D): leaf set-membership predicate on *(u16*)r1.
 * Returns 1 iff v is one of a 9-element id set, else 0. The orig is the
 * binary-search comparison tree mwcc builds from a switch returning 1.
 * Set decoded from the tree: 0x12e5,0x1303,0x149c,0x18fe,0x1920,0x1921,
 * 0x1a5c,0x1a7e,0x1a7f.  (arg0=r0 unused for the value; v read from [r1].)
 */
typedef unsigned short u16;
int func_ov002_0228a8b8(int unused, u16 *p) {
    int v = *p;
    switch (v) {
    case 0x12e5: case 0x1303: case 0x149c: case 0x18fe:
    case 0x1920: case 0x1921: case 0x1a5c: case 0x1a7e: case 0x1a7f:
        return 1;
    }
    return 0;
}
