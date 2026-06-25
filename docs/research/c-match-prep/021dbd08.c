/* CAMPAIGN-PREP candidate for func_021dbd08 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Thumb strlen counted loop (signed-char load)
 *   risk:       MUST be a *.thumb.c file (#pragma thumb on, routes to mwcc 1.2/sp2p3) and 4-aligned start; ldrsb forces signed char index
 *   confidence: high
 */
/* func_ov004_021dbd08: strlen (signed-char scan). Ships as func_ov004_021dbd08.thumb.c
 * (routes to mwcc 1.2/sp2p3 via the Thumb harness). */
#pragma thumb on
int func_ov004_021dbd08(const signed char *s) {
    int n = 0;
    while (s[n] != 0) n++;
    return n;
}
