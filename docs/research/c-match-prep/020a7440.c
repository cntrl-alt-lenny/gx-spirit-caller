/* CAMPAIGN-PREP candidate for func_020a7440 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     memcmp: counted loop, reload bytes on miss, sign 1/0/-1
 *   risk:       reload p[-1]/q[-1] and the mvncc/movcs split is reg-alloc-walled (brief-294 endgame); cmp operand order may flip
 *   confidence: low
 */
/* func_020a7440 (main, class A) — memcmp returning -1/0/1 (sign only,
 * not the byte difference). Bytes compared via post-inc loads; on the
 * first inequality both bytes are RELOADED ([r0,#-1]/[r1,#-1]) and the
 * sign decides: a<b -> -1 (mvncc), else 1 (movcs). Equal-run -> 0.
 *   recipe: counted compare loop, reload-on-miss, sign result 1/0/-1
 */
int func_020a7440(const void *a, const void *b, int n)
{
    const unsigned char *p = (const unsigned char *)a;
    const unsigned char *q = (const unsigned char *)b;
    if (n != 0) {
        do {
            if (*p++ != *q++) {
                if (p[-1] < q[-1])
                    return -1;
                return 1;
            }
        } while (--n);
    }
    return 0;
}
