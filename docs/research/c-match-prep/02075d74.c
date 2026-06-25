/* CAMPAIGN-PREP candidate for func_02075d74 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted chunk loop, min via if-assign, mvn -1
 *   risk:       avail kept on stack ([sp]) via address-escape to func_02070ac0; if mwcc keeps it in a reg the reloads diverge
 *   confidence: med
 */
extern int func_02070980(int n, void *src);
extern int func_02070ac0(int *out, void *h);
extern void func_02094688(void *dst, void *src, int n);

int func_02075d74(char *dst, int remaining, void *h)
{
    int avail;

    do {
        func_02070ac0(&avail, h);
        if (avail == 0)
            return -1;
        if (avail > remaining)
            avail = remaining;
        func_02094688(dst, h, avail);
        func_02070980(avail, h);
        dst += avail;
        remaining -= avail;
    } while (remaining > 0);

    return 0;
}
