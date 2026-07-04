/* CAMPAIGN-PREP candidate for func_02076cc0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shifted operand written as the <<-term so it folds into add operand2; signed int val; counter i first local
 *   risk:       the `if(stride==3)` 2-instr body must conditionalize (ldreqb/addeq) with cmp hoisted; if mwcc branches over it instead, diverges. reshape-able weakly (keep body to two ops); add operand-order is the secondary lever.
 *   confidence: med
 */
/* func_02076cc0: linear scan of `count` records, big-endian key match.
 *   val = (p[0]<<8)+p[1];  if (stride==3) val = (val<<8)+p[2];
 *   if (val==target) return 1;  p += stride;   ... return 0;
 * stride==3 path is CONDITIONALIZED (ldreqb/addeq), cmp r2,#3 hoisted.
 * i in r4. Shifted operand is operand2 of add (add lr, p1, p0, lsl#8). */
int func_02076cc0(unsigned char *p, int count, int stride, int target) {
    int i;
    for (i = 0; i < count; i++) {
        int val = (p[0] << 8) + p[1];
        if (stride == 3)
            val = (val << 8) + p[2];
        if (val == target)
            return 1;
        p += stride;
    }
    return 0;
}
