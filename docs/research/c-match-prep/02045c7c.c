/* CAMPAIGN-PREP candidate for func_02045c7c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-arg spill (5th-7th) + cached-arg sequential calls
 *   risk:       7-arg shape inferred from spills; mwcc arg-evaluation/spill order for the stack args may reorder; a3 passed twice
 *   confidence: med
 */
/* func_02045c7c: forward to a 7-arg SDK helper, spilling a0/a3/a1 as the
 * 5th/6th/7th stack args (a3 also passed as the 4th register arg), then call
 * func_020aaddc(a2). a2 cached in r4 (used as arg1 and in the 2nd call). */

extern void func_0209150c(int a1, int a2, void *a3, int a4, int a5, int a6, int a7);
extern void func_020aaddc(int a);
extern char data_020ff8fc[];

void func_02045c7c(int a0, int a1, int a2, int a3) {
    func_0209150c(a2, 0x1000, data_020ff8fc, a3, a0, a3, a1);
    func_020aaddc(a2);
}
