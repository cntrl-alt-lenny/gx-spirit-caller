/* CAMPAIGN-PREP candidate for func_020458d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch -> cmp/beq chain of pointer-arg tail calls
 *   risk:       low; mwcc could pick a jump table, but 3 dense cases normally stay a cmp chain
 *   confidence: high
 */
/* func_020458d8: 3-way dispatch; each case passes a distinct global address
 * to func_0204067c. Small case count -> cmp/beq chain (not a jump table),
 * cases laid in source order 0,1,2. */

extern void func_0204067c(void *p);
extern char data_020ff890[];
extern char data_020ff8b8[];
extern char data_020ff8dc[];

void func_020458d8(int sel) {
    switch (sel) {
    case 0: func_0204067c(data_020ff890); break;
    case 1: func_0204067c(data_020ff8b8); break;
    case 2: func_0204067c(data_020ff8dc); break;
    }
}
