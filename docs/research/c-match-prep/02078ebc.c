/* CAMPAIGN-PREP candidate for func_02078ebc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     volatile side-effect ldrh + return 0 (Recipe D)
 *   risk:       ldrh lands in r1 not r0 — scheduling/dest-reg of the discarded load may differ from orig
 *   confidence: med
 */
/* func_02078ebc: side-effect halfword read of p[0], return 0.
 * Brief 216 Recipe D: volatile u16* + (void)p[0] forces the dummy
 * ldrh that the optimizer would otherwise drop. (cf. func_02078ec8.)
 */

int func_02078ebc(volatile unsigned short *p) {
    (void)p[0];
    return 0;
}
