/* CAMPAIGN-PREP candidate for func_0208e85c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf call + volatile MMIO busy-wait (ands;bne)
 *   risk:       sub sp,#4 frame and ands/bne loop shape rely on mwcc; very stable pattern
 *   confidence: high
 */
extern void func_0208e43c(int reg);

void func_0208e85c(void)
{
    func_0208e43c(0x04000400);
    while (*(volatile unsigned int *)0x04000600 & 0x08000000)
        ;
}
