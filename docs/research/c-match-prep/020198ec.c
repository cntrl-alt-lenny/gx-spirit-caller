/* CAMPAIGN-PREP candidate for func_020198ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork (discarded) + signed-byte table[idx*7+5], clamp-if-assign, asr#1, double call
 *   risk:       func_02019604 called TWICE (no CSE) — must stay two call sites; `rsb idx*7` index, `asr#1` halving, and movgt clamp-as-if may reorder
 *   confidence: low
 */
/* func_020198ec: r0 = idx (-> r5). Reads signed byte data_020b5b80[idx*7 + 5]
 * (rsb r1,idx,idx,lsl#3 = idx*7; ldrsb [+5]). t = that byte. If t +
 * (func_02019604(idx) >> 1) > 0x1e, clamp t = 0x1e; ELSE t += func_02019604(idx) >> 1
 * (the call is re-issued, not CSE'd). Returns func_0201a170(0xa) + t. asr#1 is a
 * signed >>1. Clamp written as if-assign to match movgt. GetSystemWork() called
 * for its side effect, result discarded. */
extern char *GetSystemWork(void);
extern signed char data_020b5b80[];
extern int func_02019604(int);
extern int func_0201a170(int);

int func_020198ec(int idx) {
    int t;
    GetSystemWork();
    t = data_020b5b80[idx * 7 + 5];
    if (t + (func_02019604(idx) >> 1) > 0x1e)
        t = 0x1e;
    else
        t = t + (func_02019604(idx) >> 1);
    return func_0201a170(0xa) + t;
}
