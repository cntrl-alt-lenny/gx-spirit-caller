/* CAMPAIGN-PREP candidate for func_02073a5c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     zeroed 2-word scratch by-ptr to call + reload-each-use null-guard chain (.legacy.c)
 *   risk:       Orig shows NO add r0,sp before func_02073ac0 -- the by-ptr arg may add an instruction or the scratch is dead; data_0219ef20 reload-vs-bind; sp2p3.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02073a5c (main, class A).
 * UNVERIFIED build-free draft. Route -> src/main/func_02073a5c.legacy.c
 * (mwcc 1.2/sp2p3): stmfd{lr}+sub sp,#0xc + 2-step (ldmfd{lr}; bx lr /
 * ldmeqfd / ldmnefd) epilogue => Style A .legacy.c.
 *   recipe:     two zeroed stack locals passed by ptr to first call +
 *               null-guard chain RELOADING data_0219ef20 each use
 */
/* func_02073a5c: int tmp[2] = {0,0}; func_02073ac0(tmp);
 *   if (data_0219ef20 == 0) return;
 *   if (func_02091ae0(data_0219ef20) != 0) return;
 *   func_020919d8(data_0219ef20). */

extern void *data_0219ef20;              /* reloaded each use */
extern void func_02073ac0(int *out);     /* fills the 2-word scratch */
extern int  func_02091ae0(void *p);
extern void func_020919d8(void *p);

void func_02073a5c(void) {
    int tmp[2];
    tmp[0] = 0;
    tmp[1] = 0;
    func_02073ac0(tmp);
    if (data_0219ef20 == 0)
        return;
    if (func_02091ae0(data_0219ef20) != 0)
        return;
    func_020919d8(data_0219ef20);
}
