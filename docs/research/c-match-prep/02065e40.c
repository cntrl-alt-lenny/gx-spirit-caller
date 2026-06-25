/* CAMPAIGN-PREP candidate for func_02065e40 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-return + free + null-global
 *   risk:       sub/add sp #4 frame for the lr-only push may or may not be emitted by mwcc identically
 *   confidence: high
 */
/* func_02065e40: free-if-set then null the global.
 *
 *   if(data_0219e968 == 0) return;
 *   func_02054148(data_0219e968);
 *   data_0219e968 = 0;
 */

extern void *data_0219e968;
extern void  func_02054148(void *p);

void func_02065e40(void) {
    if (data_0219e968 == 0) return;
    func_02054148(data_0219e968);
    data_0219e968 = 0;
}
