/* CAMPAIGN-PREP candidate for func_020aee58 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     halfword strcpy loop (*d++=*s++) with reload-for-test; return dest
 *   risk:       the saved-ip reload of the stored halfword must reproduce; otherwise near-certain
 *   confidence: high
 */
/* func_020aee58 - wide (halfword) strcpy. copies incl. terminator,
 * re-reading the just-stored halfword via a saved ptr; returns dest. */

typedef unsigned short u16;

u16 *func_020aee58(u16 *dst, const u16 *src)
{
    u16 *p = dst;
    while ((*p++ = *src++) != 0)
        ;
    return dst;
}
