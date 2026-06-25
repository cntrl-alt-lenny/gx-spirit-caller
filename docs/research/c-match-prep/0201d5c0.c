/* CAMPAIGN-PREP candidate for func_0201d5c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER sparse switch -> if/else-if predicated stores
 *   risk:       mwcc may emit a jump table or flip beq/streq predication vs the orig branch+predicate mix
 *   confidence: med
 */
/* func_0201d5c0: sparse setter. case 4 -> g.f_0 = v (branch+str); case 9 ->
 * g.f_4 = v (predicated streq). data_02191e30 is 8 bytes = two ints. */

typedef struct {
    int f_0;
    int f_4;
} pair_02191e30;

extern pair_02191e30 data_02191e30;

void func_0201d5c0(int sel, int v) {
    if (sel == 4) {
        data_02191e30.f_0 = v;
    } else if (sel == 9) {
        data_02191e30.f_4 = v;
    }
}
