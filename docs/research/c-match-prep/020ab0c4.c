/* CAMPAIGN-PREP candidate for func_020ab0c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + nested compare loops; running ptr, match = h-1; unsigned char
 *   risk:       register allocation of running pointer (r4=h) and inner break test ordering may flip; shape sensitive
 *   confidence: med
 */
/* func_020ab0c4 - strstr (MSL_C). unsigned char (ldrb). returns the
 * match start (running ptr - 1) or NULL; empty/NULL needle -> haystack. */

char *func_020ab0c4(const char *hay, const char *needle)
{
    unsigned char first;
    unsigned char c;
    const char *h;

    if (needle == 0 || (first = (unsigned char)*needle) == 0)
        return (char *)hay;

    c = (unsigned char)*hay;
    h = hay + 1;
    if (c == 0)
        return 0;

    do {
        if (c == first) {
            const char *m = h;
            const char *n = needle + 1;
            unsigned char nc, mc;
            do {
                nc = (unsigned char)*n++;
                mc = (unsigned char)*m++;
                if (mc != nc)
                    break;
            } while (mc != 0);
            if (nc == 0)
                return (char *)(h - 1);
        }
        c = (unsigned char)*h++;
    } while (c != 0);

    return 0;
}
