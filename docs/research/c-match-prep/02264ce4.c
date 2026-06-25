/* CAMPAIGN-PREP candidate for func_02264ce4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain of predicate calls + linear tail calls, shared 0x151e
 *   risk:       021bbf50(player) then 021bbf50(1-player) reuse; reg-alloc of player across calls and the trailing 021df6d4/021e276c order may shift.
 *   confidence: med
 */
/* func_ov002_02264ce4: require 021b3ecc(player,11,0x151e),
 * 021bbf50(player) true and 021bbf50(1-player) false; then run
 * 021df6d4 + 021e276c and return 0; else return 1. */

extern int  func_ov002_021b3ecc(int player, int kind, int code);
extern int  func_ov002_021bbf50(int player);
extern void func_ov002_021df6d4(int player, int code);
extern void func_ov002_021e276c(int a, int b, int c, int d);

int func_ov002_02264ce4(int player) {
    if (func_ov002_021b3ecc(player, 0xb, 0x151e) == 0)
        return 1;
    if (func_ov002_021bbf50(player) == 0)
        return 1;
    if (func_ov002_021bbf50(1 - player) != 0)
        return 1;
    func_ov002_021df6d4(player, 0x151e);
    func_ov002_021e276c(player, 0x151e, 5, 0);
    return 0;
}
