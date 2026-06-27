/* CAMPAIGN-PREP candidate for func_0204a960 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain (cmp/beq) on 0/1/2 returning constants; default direct-literal call then return a0
 *   risk:       orig has a dead `movs r0,#6; beq .L_4b4` - the cls==0 guard skipped because cls is the literal 6. A plain unconditional call won't emit that movs/beq; to reproduce it the C needs an `int cls=6; if(cls)` shaped guard. reshape-able (add explicit if(cls) wrapper).
 *   confidence: med
 */
/* func_0204a960 - main - class D (small if-chain switch returning constants).
 * a0==0 -> 0; a0==1 -> 1; a0==2 -> 2; default: func_02050054(6, 0xfffeb007)
 * then return a0. The `movs r0,#6; beq` is the dead branch of the shared
 * if(cls) guard (cls is the constant 6, so the call always fires). _LIT0 here
 * is the final pointer (direct literal, no mvn/add split). */

extern void func_02050054(int cls, int msg);

int func_0204a960(int a0) {
    if (a0 == 0) return 0;
    if (a0 == 1) return 1;
    if (a0 == 2) return 2;
    func_02050054(6, (int)0xfffeb007);
    return a0;
}
