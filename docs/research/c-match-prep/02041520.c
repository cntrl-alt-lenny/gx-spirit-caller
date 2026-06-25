/* CAMPAIGN-PREP candidate for func_02041520 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ands/bicne mask-clear idiom (if-test then in-place clear)
 *   risk:       mwcc may emit tst;bicne or fold to a plain bic instead of ands;bicne — the if-guard form is the steer
 *   confidence: med
 */
#include "types.h"

int func_02041520(int n)
{
    if (n & 0x8000) {
        n &= ~0x8000;
    }
    return n;
}
