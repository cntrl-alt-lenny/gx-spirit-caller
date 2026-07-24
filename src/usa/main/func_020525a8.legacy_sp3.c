/* CAMPAIGN-PREP candidate for func_020525a8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null guards (global RELOAD via ip) then 2-way tail dispatch; sp3
 *   risk:       global ptr non-null guard via ip; func_020521a4 vs func_020520ec picked by (r3!=0); sp3 routing
 *   confidence: med
 */
/* func_020525a8 -> src/main/func_020525a8.legacy_sp3.c (mwcc 1.2/sp3) */
extern void *data_0219e30c;
extern void  func_020520ec(int, int, int);
extern void  func_020521a4(int, int, int);

void func_020525a8(int a, int b, int c, int d) {
    (void)a;
    if (data_0219e30c == 0) return;
    if (b == 0) return;
    if (c == 0) return;
    if (d != 0)
        func_020521a4(a, b, c);
    else
        func_020520ec(a, b, c);
}
