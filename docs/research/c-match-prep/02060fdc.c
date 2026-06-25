/* CAMPAIGN-PREP candidate for func_02060fdc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted compare loop; continue-guards; early bxne return
 *   risk:       low; first-iteration unguarded loop entry and continue ordering should match exactly
 *   confidence: high
 */
/* func_02060fdc: compare two 0x20-byte buffers, skipping indices 0
 * and 0xd; return 1 if all compared bytes equal, else 0.
 */

int func_02060fdc(unsigned char *a, unsigned char *b) {
    int i;
    for (i = 0; i < 0x20; i++) {
        if (i == 0) continue;
        if (i == 0xd) continue;
        if (a[i] != b[i]) return 0;
    }
    return 1;
}
