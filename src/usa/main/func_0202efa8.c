/* CAMPAIGN-PREP candidate for func_0202efa8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch returning constants -> compare-tree
 *   risk:       mwcc pivot/offset encoding (base 0x1913, sub 0xdc / add 0x4f / add 0xac) must match case ordering
 *   confidence: med
 */
/* func_0202efa8 — sparse switch membership returning 0/1 (binary-search compare tree) */
int func_0202efa8(int x) {
    switch (x) {
    case 0x1837:
    case 0x1913:
    case 0x1962:
    case 0x19bf:
        return 1;
    }
    return 0;
}
