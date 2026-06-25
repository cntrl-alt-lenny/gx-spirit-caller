/* CAMPAIGN-PREP candidate for func_021b4b64 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: sorted value-set membership, pre-zeroed bool return
 *   risk:       orig is a balanced bgt/bge SEARCH TREE (median 0x1932 first, +0xce reuse for 0x1b06); a flat `||` chain emits sequential cmps in source order — structural mismatch a C reshape won't fix (permuter-class / .s).
 *   confidence: low
 */
/* func_ov002_021b4b64: membership predicate. Returns 1 iff arg0 is one of
 * { 0x12fd, 0x1300, 0x1517, 0x1932, 0x1a38, 0x1b06 }, else 0. The orig
 * emits a SORTED comparison tree (tests the median 0x1932 first via bgt/bge),
 * not a flat OR chain. */
int func_ov002_021b4b64(int v) {
    if (v == 0x12fd || v == 0x1300 || v == 0x1517 ||
        v == 0x1932 || v == 0x1a38 || v == 0x1b06)
        return 1;
    return 0;
}
