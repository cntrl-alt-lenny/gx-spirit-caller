/* CAMPAIGN-PREP candidate for func_0201ecb4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MUL by const + TAIL CALL via bx (leaf)
 *   risk:       mwcc may emit mul r0,r0,#0x54 form or reorder mov #4/#0; tail bx requires leaf TCO to fire
 *   confidence: high
 */
/* func_0201ecb4: index -> Task_PostLocked(index * 0x54, 4, 0) as a tail call
 * (leaf, no frame -> bx). 0x54 is materialized then multiplied (mul r1,r0,r1). */

extern int Task_PostLocked(int a0, int a1, int a2);

int func_0201ecb4(int index) {
    return Task_PostLocked(index * 0x54, 4, 0);
}
