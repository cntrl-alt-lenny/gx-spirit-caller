/* CAMPAIGN-PREP candidate for func_021bc6e8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fixed table scan + early return-on-hit (movne r0; mvn -1)
 *   risk:       v held in callee-saved r6 across call; base bind to r4 must hold
 *   confidence: high
 */
/* func_ov002_021bc6e8: scan a fixed 5-entry table; return the first entry
 * for which func_ov002_021bc55c(arg0, entry)!=0, else -1. */
extern int data_ov002_022bdfc4[];
extern int func_ov002_021bc55c(int a, int b);

int func_ov002_021bc6e8(int arg0) {
    int i;
    for (i = 0; i < 5; i++) {
        int v = data_ov002_022bdfc4[i];
        if (func_ov002_021bc55c(arg0, v) != 0)
            return v;
    }
    return -1;
}
