/* CAMPAIGN-PREP candidate for func_0204aaf4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table switch (cmp #6 + addls pc) sets (cls,off) pair via mvn(~K); unconditional add(base)+call; uninitialised default off
 *   risk:       the (int)0xfffeb3f8 + ~K constant folds in C; mwcc may emit one pooled-literal ldr instead of the orig mvn r2,#K + add r1,r2,_LIT0 split. The branch-table itself (addls pc,pc,r4,lsl#2) should reproduce. reshape-able if a symbol base keeps the +~K separate; else permuter-class.
 *   confidence: med
 */
/* func_0204aaf4 - main - class D (switch sets (cls,off) pair, unconditional
 * tail call). a0==0 -> 0. Else branch-table switch on a0 (1..6):
 * 1->(6,~0x31) 2->(6,~0x1d) 3->(6,~0x13) 4->(6,~0x27) 5->(9,~0) 6->(9,~1);
 * default leaves cls=a0, off uninitialised. Tail ALWAYS calls
 * func_02050054(cls, 0xfffeb3f8 + off); returns a0. BASE not encodable ->
 * .s uses mvn (off=~K) + add (base); keep off as a small ~K constant. */

extern void func_02050054(int cls, int msg);

int func_0204aaf4(int a0) {
    int cls = a0;
    int off;            /* uninitialised in default path */

    if (a0 == 0)
        return 0;

    switch (a0) {
    case 1: cls = 6; off = ~0x31; break;
    case 2: cls = 6; off = ~0x1d; break;
    case 3: cls = 6; off = ~0x13; break;
    case 4: cls = 6; off = ~0x27; break;
    case 5: cls = 9; off = ~0x0; break;
    case 6: cls = 9; off = ~0x1; break;
    }

    func_02050054(cls, (int)0xfffeb3f8 + off);
    return a0;
}
