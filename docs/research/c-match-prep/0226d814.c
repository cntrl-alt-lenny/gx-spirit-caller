/* CAMPAIGN-PREP candidate for func_0226d814 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear constant-compare if-chain; near-constant CSE (add #0xc0)
 *   risk:       mwcc may not fold 0x1a65 to 0x19a5+0xc0, or may merge the two `return 3` arms / reorder; ships as .s
 *   confidence: low
 */
/* func_ov002_0226d814: constant-return classifier over three id literals.
 *   x==0x17c6 -> 2 ;  x==0x19a5 -> 3 ;  x==0x1a65 -> 3 ;  else 1.
 * The third constant 0x1a65 = 0x19a5 + 0xc0, so mwcc reuses the loaded 0x19a5
 * and forms it with `add r1,r1,#0xc0` rather than a fresh pool load -- writing
 * the comparisons as a linear if-chain on these literals reproduces that. */
int func_ov002_0226d814(int arg0) {
    if (arg0 == 0x17c6) return 2;
    if (arg0 == 0x19a5) return 3;
    if (arg0 == 0x1a65) return 3;
    return 1;
}
