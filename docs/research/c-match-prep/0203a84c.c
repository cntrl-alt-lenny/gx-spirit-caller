/* CAMPAIGN-PREP candidate for func_0203a84c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-test fast path; bound list base; iterator while-loop
 *   risk:       iterator var (passed as arg2 + reloaded from return) may land in callee-saved reg vs orig's r1
 *   confidence: med
 */
/* func_0203a84c - bit-flag fast path via func_02089024, else iterate list until f14==a0 */

extern void *func_02089024(int a0);
extern void *func_0207cfdc(void *list, void *prev);
extern int   data_0219c494;

void *func_0203a84c(int a0)
{
    void *e;
    void *list;

    if (!(a0 & 0x8000000)) {
        void *r = func_02089024(a0);
        if (r)
            return (char *)r - 0x20;
    }

    list = &data_0219c494;
    e = 0;
    while ((e = func_0207cfdc(list, e)) != 0 &&
           *(int *)((char *)e + 0x14) != a0)
        ;
    return e;
}
