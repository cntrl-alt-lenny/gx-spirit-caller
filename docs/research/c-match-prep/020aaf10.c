/* CAMPAIGN-PREP candidate for func_020aaf10 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR/strcpy loop; signed char (ldrsb); return orig ptr
 *   risk:       find-end loop may emit while-form instead of post-inc+sub#1; char signedness assumed signed
 *   confidence: high
 */
/* func_020aaf10 - strcat (MSL_C, mwcc 2.0/sp1p5 -O4,p).
 * find end of dest (signed char, ldrsb), then copy src incl. NUL,
 * re-reading the just-stored byte through a saved pointer for the test.
 * returns the original dest pointer. */

char *func_020aaf10(char *dst, const char *src)
{
    char *p = dst;
    while (*p)
        p++;
    while ((*p++ = *src++) != 0)
        ;
    return dst;
}
