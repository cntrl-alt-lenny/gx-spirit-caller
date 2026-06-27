/* CAMPAIGN-PREP candidate for func_0202bc38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: branch on flag; orr 1<<bit / and ~(1<<bit) RMW store-order
 *   risk:       stmdb pushes {r3,r4,r5,lr} and holds arg1->r5, arg2->r4 across the call; mwcc must spill both callee-saved before bl. If it reorders the r4/r5 moves or omits r3, the prologue/regset diverges. reshape-able via decl/use order; else permuter-class.
 *   confidence: med
 */
// func_0202bc38 — set or clear a single bit in a byte buffer
// arg1 (r1) = bit position, arg2 (r2) = nonzero->set / zero->clear.
// func_0202b0b4 returns the byte index.
extern unsigned char data_02105eb8[];
extern int func_0202b0b4(void);

void func_0202bc38(int unused, int bit, int set)
{
    int idx = func_0202b0b4();
    if (set) {
        data_02105eb8[idx] = (unsigned char)(data_02105eb8[idx] | (1 << bit));
    } else {
        data_02105eb8[idx] = (unsigned char)(data_02105eb8[idx] & ~(1 << bit));
    }
}
