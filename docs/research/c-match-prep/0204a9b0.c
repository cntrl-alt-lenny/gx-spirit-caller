/* CAMPAIGN-PREP candidate for func_0204a9b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain compares 1/2/3 (cmp/beq, case3 inline moveq/mvneq); (cls,off) pair; unconditional call; uninitialised default off
 *   risk:       orig encodes case3 inline via moveq r0,#6 / mvneq r2,#0x1d on the `cmp r4,#3` (predication, not a branch). A C switch will likely emit a branch+block for case3 instead of conditional moves, so the case3 codegen diverges. reshape-able (write cases 1/2 as if/beq, case3 as a fall-through ?: on the cmp).
 *   confidence: med
 */
/* func_0204a9b0 - main - class D (switch sets (cls,off) pair, unconditional
 * tail call). a0==0 -> 0. Else switch: 1->(9,~0) 2->(6,~0x31) 3->(6,~0x1d);
 * default leaves cls=a0, off uninitialised. Tail ALWAYS calls
 * func_02050054(cls, 0xfffeb010 + off); returns a0. BASE not encodable so the
 * .s uses mvn (off=~K) + add (base) -> keep off as a small ~K constant. */

extern void func_02050054(int cls, int msg);

int func_0204a9b0(int a0) {
    int cls = a0;
    int off;            /* uninitialised in default path */

    if (a0 == 0)
        return 0;

    switch (a0) {
    case 1: cls = 9; off = ~0x0; break;
    case 2: cls = 6; off = ~0x31; break;
    case 3: cls = 6; off = ~0x1d; break;
    }

    func_02050054(cls, (int)0xfffeb010 + off);
    return a0;
}
