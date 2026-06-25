/* CAMPAIGN-PREP candidate for func_02056068 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global==1 gate + arg null gate (return 2) + tail call
 *   risk:       predicated addne/moveq returns vs branches may differ; global reloaded (not bound) matches asm; otherwise clean
 *   confidence: med
 */
/* func_02056068: if (data_0219e3f0 != 1) return 2; if (p == 0) return 2;
 *   return func_0205673c(p);  (global gate then arg gate then tail call)
 */

extern int data_0219e3f0;
extern int func_0205673c(void *p);

int func_02056068(void *p) {
    if (data_0219e3f0 != 1) return 2;
    if (p == 0) return 2;
    return func_0205673c(p);
}
