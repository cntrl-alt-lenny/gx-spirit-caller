/* CAMPAIGN-PREP candidate for func_02076c5c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     small table-search loop, halfword reload on hit
 *   risk:       table reloaded via second ldr _LIT0 on hit (RELOAD not bind) — must keep data ref inside both uses; return promoted u16
 *   confidence: med
 */
extern const unsigned short data_02101ec4[];
extern int func_02076cc0(void *a, void *b, void *c, int key);

unsigned short func_02076c5c(void *a, void *b, void *c)
{
    int i = 0;

    do {
        if (func_02076cc0(a, b, c, data_02101ec4[i]) != 0)
            return data_02101ec4[i];
        i++;
    } while (i < 2);

    return 0;
}
