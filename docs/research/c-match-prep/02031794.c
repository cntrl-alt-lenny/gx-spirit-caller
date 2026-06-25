/* CAMPAIGN-PREP candidate for func_02031794 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-constant eq membership (separate literals)
 *   risk:       mwcc may instead add-from-base (gap 0x1AB is encodable); both-literal form is what asm shows
 *   confidence: med
 */
/* func_02031794: 2-way membership over 0x12D3 and 0x147E. Here the
 * second comparand is loaded as its own literal (ldrne r1,_LIT1)
 * rather than added from the base, so just the two constants.
 *
 *     ldr r1,=0x12D3; cmp r0,r1; ldrne r1,=0x147E; cmpne r0,r1
 *     bne .L; mov r0,#1; bx lr
 */

int func_02031794(int x) {
    if (x == 0x12D3 || x == 0x147E) return 1;
    return 0;
}
