/* CAMPAIGN-PREP candidate for func_02065e04 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear-search loop + ble guard + reload global each use
 *   risk:       key vs result compare order (cmp r6,r0) may flip operands; r4 binds global but count reloads — matched
 *   confidence: med
 */
/* func_02065e04: linear search; for i in [0,count) compare key against
 * func_0205405c(g,i); on match tail-call func_02053e40(g,i). count via
 * func_020540cc(g); guard count<=0.
 *
 *   n=func_020540cc(*g); if(n<=0) return;
 *   for(i=0;;){ if(key==func_0205405c(*g,i)) { func_02053e40(*g,i); return; }
 *              if(++i>=func_020540cc(*g)) return; }
 */

extern void *data_0219e888;
extern void  func_02053e40(void *g, int i);
extern int   func_0205405c(void *g, int i);
extern int   func_020540cc(void *g);

void func_02065e04(int key) {
    int i = 0;

    if (func_020540cc(data_0219e888) <= 0) return;
    do {
        if (key == func_0205405c(data_0219e888, i)) {
            func_02053e40(data_0219e888, i);
            return;
        }
        i++;
    } while (i < func_020540cc(data_0219e888));
}
