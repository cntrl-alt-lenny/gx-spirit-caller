/* CAMPAIGN-PREP candidate for func_0209aa48 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MMIO halfword read; (x & 1) ? 1 : 0 boolean (movne/moveq)
 *   risk:       ternary must lower to ands;movne #1;moveq #0; should match. Pool word 0x4000304 placement standard.
 *   confidence: high
 */
/* func_0209aa48: MMIO bit-test boolean accessor. Reads u16 at 0x04000304
 * (POWCNT2) and returns bit 0 normalised to 0/1.
 */

int func_0209aa48(void) {
    return (*(volatile unsigned short *)0x04000304 & 1) ? 1 : 0;
}
