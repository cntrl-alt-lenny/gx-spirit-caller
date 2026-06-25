/* CAMPAIGN-PREP candidate for func_0208f38c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + call + two clears in store-order (6328 then 6324)
 *   risk:       two-store scheduling: mwcc loads both addrs then stores; order should hold but could reorder
 *   confidence: high
 */
extern int data_0210249c;
extern int data_021a6324;
extern void *data_021a6328;
extern void func_02093dc8(void);
extern void func_0208d6f4(void *handle);

void func_0208f38c(void)
{
    if (data_0210249c != -1)
        func_02093dc8();
    func_0208d6f4(data_021a6328);
    data_021a6328 = 0;
    data_021a6324 = 0;
}
