/* CAMPAIGN-PREP candidate for func_020a6afc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     copy loop; signed char load (ldrsb); pre-check do-while; preserve dest
 *   risk:       asm reloads *src at loop top + pre-indexed [r1,#1]! — may need src as signed char* read twice; post-inc strb [r0],#1 form
 *   confidence: med
 */
// strcpy with signed char, returns dest
char *func_020a6afc(char *dst, const signed char *src)
{
    char *p = dst;
    if (*src != 0) {
        do {
            *p++ = (char)*src;
            src++;
        } while (*src != 0);
    }
    *p = 0;
    return dst;
}
