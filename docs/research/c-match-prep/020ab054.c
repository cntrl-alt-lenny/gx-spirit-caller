/* CAMPAIGN-PREP candidate for func_020ab054 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + unsigned-char compare loop; subne difference; n==0 early 0
 *   risk:       load order of s2 before s1 must match (ldrb ip,[r1] first); n width (size_t) could alter cmp
 *   confidence: high
 */
/* func_020ab054 - strncmp (MSL_C). unsigned char compares (ldrb),
 * difference = *s1 - *s2, n==0 -> 0, stop on NUL. */

int func_020ab054(const char *s1, const char *s2, unsigned long n)
{
    if (n != 0) {
        do {
            unsigned char c2 = (unsigned char)*s2++;
            unsigned char c1 = (unsigned char)*s1++;
            if (c1 != c2)
                return (int)c1 - (int)c2;
            if (c1 == 0)
                break;
        } while (--n != 0);
    }
    return 0;
}
