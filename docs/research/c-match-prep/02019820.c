/* CAMPAIGN-PREP candidate for func_02019820 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork (discarded) + guard `>=5` then `>0 ? 1 : 0` flag return
 *   risk:       GetSystemWork return is computed but unused (must stay sequenced); `movgt r0,#1` + fallthrough `mov r0,#0` flag-clamp may emit differently
 *   confidence: med
 */
/* func_02019820: predicate. r0 = arg (-> r4). Calls GetSystemWork() (result
 * discarded but the call is emitted), then if func_02019604(arg) < 5 returns 0;
 * else returns func_020197ac(arg) > 0 ? 1 : 0. The `cmp #0; movgt r0,#1;
 * ldmgt` then fallthrough `mov r0,#0` is an `if (x>0) return 1; return 0;`
 * shape. Frame uses only r4 (single callee-saved). */
extern char *GetSystemWork(void);
extern int  func_02019604(int);
extern int  func_020197ac(int);

int func_02019820(int a) {
    GetSystemWork();
    if (func_02019604(a) < 5)
        return 0;
    if (func_020197ac(a) > 0)
        return 1;
    return 0;
}
