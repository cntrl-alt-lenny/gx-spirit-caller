/* CAMPAIGN-PREP candidate for func_0201d5e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH getter switch returning two global loads + default 0
 *   risk:       mwcc could lower 2 sparse cases as jump table instead of cmp;beq;cmp;beq chain
 *   confidence: med
 */
/* func_0201d5e8: sparse getter. case 4 -> return g.f_0; case 9 -> return g.f_4;
 * default 0. data_02191e30 is 8 bytes = two ints. */

typedef struct {
    int f_0;
    int f_4;
} pair_02191e30;

extern pair_02191e30 data_02191e30;

int func_0201d5e8(int sel) {
    switch (sel) {
    case 4: return data_02191e30.f_0;
    case 9: return data_02191e30.f_4;
    }
    return 0;
}
