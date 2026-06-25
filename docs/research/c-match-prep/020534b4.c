/* CAMPAIGN-PREP candidate for func_020534b4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     cond ? value : 0 via and-with-mask select
 *   risk:       mwcc may emit a plain movne x/moveq 0 instead of the mvnne/andne mask trio; reg-alloc-walled per .s header
 *   confidence: low
 */
/* func_020534b4: call then conditional mask-select.
 *   m = func_020534d4(x); return m ? x : 0;
 * mwcc lowers the select as mvnne #0 / andne x,mask / moveq #0
 * (mask = all-ones when true). r4 holds x across the call.
 * (Flagged reg-alloc-walled in ship-as-.s; best-effort reshape.) */

extern int func_020534d4(int x);

int func_020534b4(int x) {
    return func_020534d4(x) ? x : 0;
}
