/* CAMPAIGN-PREP candidate for func_02053600 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bic+orr bitfield merge (mask-clear low2, or-in arg)
 *   risk:       frame reserves 0x4 with no apparent stack use — likely an alignment pad mwcc emits; orr operand order (v&~3)|r4 matches bic-then-orr.
 *   confidence: med
 */
extern void func_0205362c(int a, int v);
extern int func_020536a0(int a);

void func_02053600(int r5, int r4) {
    int v = func_020536a0(r4);
    func_0205362c(r5, (v & ~3) | r4);
}
