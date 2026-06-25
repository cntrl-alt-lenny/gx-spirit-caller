/* CAMPAIGN-PREP candidate for func_020a6a00 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     scan loop; signed char (ldrsb); pre-check + do-while
 *   risk:       index form s[n] vs pointer-bump must match the [r0,r2] addressing; signedness of char (ldrsb) load
 *   confidence: high
 */
// strlen with signed char
int func_020a6a00(const signed char *s)
{
    int n = 0;
    if (s[0] != 0) {
        do {
            n++;
        } while (s[n] != 0);
    }
    return n;
}
