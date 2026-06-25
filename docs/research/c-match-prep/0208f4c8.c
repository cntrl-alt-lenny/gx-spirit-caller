/* CAMPAIGN-PREP candidate for func_0208f4c8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + call + three clears in store-order (6334,6330,632c)
 *   risk:       three-store load-then-store scheduling order may reorder; -1 compare codegen
 *   confidence: high
 */
extern int data_0210249c;
extern int data_021a632c;
extern int data_021a6330;
extern void *data_021a6334;
extern void func_02093dc8(void);
extern void func_0208d7ac(void *handle);

void func_0208f4c8(void)
{
    if (data_0210249c != -1)
        func_02093dc8();
    func_0208d7ac(data_021a6334);
    data_021a6334 = 0;
    data_021a6330 = 0;
    data_021a632c = 0;
}
