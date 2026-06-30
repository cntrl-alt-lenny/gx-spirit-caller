/* CAMPAIGN-PREP candidate for func_02065e78 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear-search loop + ble guard + reload global each use
 *   risk:       key vs result compare order (cmp r6,r0) may flip operands; r4 binds global but count reloads — matched
 *   confidence: med
 */
/* func_02065e78: linear search; for i in [0,count) compare key against
 * func_020540d0(g,i); on match tail-call func_02053eb4(g,i). count via
 * func_02054140(g); guard count<=0.
 *
 *   n=func_02054140(*g); if(n<=0) return;
 *   for(i=0;;){ if(key==func_020540d0(*g,i)) { func_02053eb4(*g,i); return; }
 *              if(++i>=func_02054140(*g)) return; }
 */

extern void *data_0219e968;
extern void  func_02053eb4(void *g, int i);
extern int   func_020540d0(void *g, int i);
extern int   func_02054140(void *g);

void func_02065e78(int key) {
    int i = 0;

    if (func_02054140(data_0219e968) <= 0) return;
    do {
        if (key == func_020540d0(data_0219e968, i)) {
            func_02053eb4(data_0219e968, i);
            return;
        }
        i++;
    } while (i < func_02054140(data_0219e968));
}
