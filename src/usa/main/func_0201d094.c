/* CAMPAIGN-PREP candidate for func_0201d094 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Counted loop with conditional increment (cmp;addne)
 *   risk:       Register pairing (count r0, i r3, base r2 hoisted) should match; very low risk.
 *   confidence: high
 */
/* func_0201d094: count nonzero entries.
 *   count = 0;
 *   for (i = 0; i < 0x20; i++) if (data_0218feac[i] != 0) count++;
 *   return count;
 */

extern int data_0218feac[];

int func_0201d094(void) {
    int count = 0;
    int i;
    for (i = 0; i < 0x20; i++) {
        if (data_0218feac[i] != 0) {
            count++;
        }
    }
    return count;
}
