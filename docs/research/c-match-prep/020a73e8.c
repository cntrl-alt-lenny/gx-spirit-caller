/* CAMPAIGN-PREP candidate for func_020a73e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     forward memchr: post-inc scan, return p-1 on hit
 *   risk:       post-inc + (s-1) back-up vs a pre-test pointer form may compile to different ptr arithmetic; mask-hoist must survive
 *   confidence: med
 */
/* func_020a73e8 (main, class A) — forward memchr. The search byte is
 * masked once before the loop (and r3,r1,#0xff). Pointer is post-
 * incremented each iteration (ldrb [r0],#1); on a hit it backs up one
 * (subeq r0,r0,#1) and returns the matching address; miss-exhaust -> 0.
 *   recipe: counted scan, post-inc ptr, hit returns p-1, else NULL
 */
void *func_020a73e8(void *p, int c, int n)
{
    unsigned char *s = (unsigned char *)p;
    unsigned char ch = (unsigned char)c;
    if (n != 0) {
        do {
            if (*s++ == ch)
                return s - 1;
        } while (--n);
    }
    return 0;
}
