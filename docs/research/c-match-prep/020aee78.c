/* CAMPAIGN-PREP candidate for func_020aee78 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     halfword strchr incl. terminator; hoisted load, post-inc+backup; tail ch==0
 *   risk:       u16 ch may add a halfword mask on r1 absent in target; final p-1 vs movne/subeq tail must map
 *   confidence: med
 */
/* func_020aee78 - wide (halfword) strchr. scans incl. terminator so
 * ch==0 returns the NUL position; otherwise NULL on not-found.
 * load is hoisted; on match the post-incremented ptr is backed up. */

typedef unsigned short u16;

u16 *func_020aee78(u16 *p, u16 ch)
{
    u16 c = *p++;
    if (c != 0) {
        do {
            if (c == ch)
                return p - 1;
            c = *p++;
        } while (c != 0);
    }
    if (ch != 0)
        return 0;
    return p - 1;
}
