/* CAMPAIGN-PREP candidate for func_020ace98 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     halfword search loop; load-compare-then-postinc; n==0 early NULL
 *   risk:       u16 value param may force a lsl#16/lsr mask on r1 that the target lacks; try int v if masked
 *   confidence: med
 */
/* func_020ace98 - halfword memchr/wmemchr. ldrh (unsigned 16-bit),
 * count of halfwords; returns ptr to first match or NULL. */

typedef unsigned short u16;

u16 *func_020ace98(u16 *p, u16 v, int n)
{
    if (n != 0) {
        do {
            if (*p == v)
                return p;
            p++;
        } while (--n != 0);
    }
    return 0;
}
