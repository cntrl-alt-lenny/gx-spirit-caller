/* CAMPAIGN-PREP candidate for func_02281920 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain return-1 predication; u16 arg cast; !=0 tail
 *   risk:       none material — VERIFIED byte-exact. Single early-returns predicate (movne#1) as orig has, not branch.
 *   confidence: high
 */
extern int func_ov002_021ba5ec(int a, unsigned short b);
extern int func_ov002_021c3a04(int a, unsigned short b);
extern int func_ov002_021c2e44(int a, int b);
extern int func_ov002_021bbc34(int a, int b);

int func_ov002_02281810(int a, int b) {
    if (func_ov002_021ba5ec(a, (unsigned short)b)) return 1;
    if (func_ov002_021c3a04(a, (unsigned short)b)) return 1;
    if (func_ov002_021c2e44(a, b)) return 1;
    return func_ov002_021bbc34(a, b) != 0;
}
