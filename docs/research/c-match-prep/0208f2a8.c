/* CAMPAIGN-PREP candidate for func_0208f2a8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (!=-1) + call + reload-clear global (clone of f1c4)
 *   risk:       identical-shape clone; -1 compare codegen and global type are the only variables
 *   confidence: high
 */
extern int data_0210249c;
extern void *data_021a6320;
extern void func_02093dc8(void);
extern void func_0208d030(void *handle);

void func_0208f2a8(void)
{
    if (data_0210249c != -1)
        func_02093dc8();
    func_0208d030(data_021a6320);
    data_021a6320 = 0;
}
