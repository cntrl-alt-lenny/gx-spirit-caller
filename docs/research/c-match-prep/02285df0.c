/* CAMPAIGN-PREP candidate for func_02285df0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     forwarder: two calls, data ptr as arg4, d as stack arg5
 *   risk:       none material — VERIFIED byte-exact. Return type int vs void indistinguishable in bytes (r0 from 2nd call either way).
 *   confidence: high
 */
extern void func_ov002_0228387c(int a, int b, int c, int d);
extern int  func_ov002_022848e0(int a, int b, int c, void *p, int e);
extern char data_ov002_022cd71c[];

int func_ov002_02285df0(int a, int b, int c, int d) {
    func_ov002_0228387c(a, b, c, d);
    return func_ov002_022848e0(a, b, c, data_ov002_022cd71c, d);
}
