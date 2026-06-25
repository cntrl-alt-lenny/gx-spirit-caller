/* CAMPAIGN-PREP candidate for func_02007f38 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     large constant synthesis (mov+orr chain) single field store
 *   risk:       mwcc may decompose 0x52008421 in a different orr order than orig (0x21,0x8400,0x52000000).
 *   confidence: med
 */
/* func_02007f38: write the composite constant 0x52008421 to field 0xa74.
 * mwcc synthesizes the immediate via mov#0; orr#0x21; orr#0x8400;
 * orr#0x52000000 (no single valid ARM rotate). Field is u32.
 */
extern char data_02104f3c[];

void func_02007f38(void) {
    *(unsigned int *)(data_02104f3c + 0xa74) = 0x52008421u;
}
