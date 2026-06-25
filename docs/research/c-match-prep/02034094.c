/* CAMPAIGN-PREP candidate for func_02034094 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     range guard (blt->0) + (v<=K)->movle/mov bool; K from pool
 *   risk:       first param assumed unused so value lands in r1; minor: movle/mov vs movle/movgt ordering
 *   confidence: high
 */
/* func_02034094 — two-bound range test on 2nd arg, returns bool */

int func_02034094(int unused, int v)
{
    if (v < 0xc800)
        return 0;
    return v <= 0xc863;
}
