/* CAMPAIGN-PREP candidate for func_0205261c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null guards (global RELOAD via ip) then 2-way tail dispatch; sp3
 *   risk:       global ptr non-null guard via ip; func_02052218 vs func_02052160 picked by (r3!=0); sp3 routing
 *   confidence: med
 */
/* func_0205261c -> src/main/func_0205261c.legacy_sp3.c (mwcc 1.2/sp3) */
extern void *data_0219e3ec;
extern void  func_02052160(int, int, int);
extern void  func_02052218(int, int, int);

void func_0205261c(int a, int b, int c, int d) {
    (void)a;
    if (data_0219e3ec == 0) return;
    if (b == 0) return;
    if (c == 0) return;
    if (d != 0)
        func_02052218(a, b, c);
    else
        func_02052160(a, b, c);
}
