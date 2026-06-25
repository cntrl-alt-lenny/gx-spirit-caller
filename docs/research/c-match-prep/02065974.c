/* CAMPAIGN-PREP candidate for func_02065974 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + chained derefs (ldrne triple)
 *   risk:       non-(-1) path leaves r0 undefined in asm — returning 0 may add a movne the orig lacks; field_c index 3 assumed
 *   confidence: med
 */
/* func_02065974: guard on func_02054c0c()!=-1, else triple-deref a
 * pointer fetched from func_0206ebe8(p).
 *
 *   mov r4,r0; if(func_02054c0c() != -1) return (undefined r0);
 *   r=func_0206ebe8(r4); if(r==0) return 0;
 *   return *(*(int**)r->[0xc]);
 */

extern int   func_02054c0c(void);
extern int **func_0206ebe8(void *p);   /* returns obj; obj[3]=int** */

int func_02065974(void *p) {
    int **obj;

    if (func_02054c0c() != -1) return 0;
    obj = func_0206ebe8(p);
    if (obj == 0) return 0;
    return **(int **)obj[3];        /* r->[0xc] -> deref -> deref */
}
