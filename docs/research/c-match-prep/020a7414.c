/* CAMPAIGN-PREP candidate for func_020a7414 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     reverse memchr: p+=n, pre-dec scan, return s on hit
 *   risk:       add r0,r0,r2 hoist + pre-dec form must match; n-as-byte-count vs ptr scaling could reorder the base add
 *   confidence: med
 */
/* func_020a7414 (main, class A) — reverse memchr (memrchr). Start at
 * p+n (add r0,r0,r2), search byte masked once, pointer PRE-decremented
 * each step (ldrb [r0,#-1]!); first hit returns that address, else 0.
 *   recipe: p+=n; pre-dec scan; hit returns p; else NULL
 */
void *func_020a7414(void *p, int c, int n)
{
    unsigned char *s = (unsigned char *)p + n;
    unsigned char ch = (unsigned char)c;
    if (n != 0) {
        do {
            if (*--s == ch)
                return s;
        } while (--n);
    }
    return 0;
}
