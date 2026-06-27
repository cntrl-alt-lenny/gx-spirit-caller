/* CAMPAIGN-PREP candidate for func_02022608 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: signed guard; predicated *a1 store; return base+0x4c+a0*0x10 (const-add before index)
 *   risk:       orig computes return as add #0x4c then add a0<<4 (r3+0x4c, then +index), and predicates the *a1 store; mwcc may merge the index into one add or branch the store. reshape-able (operand order base+0x4c first)
 *   confidence: med
 */
/* func_02022608: guard data_0219747c[a0]>=0 else 0; optionally out a0's
 * f48 to *a1; return &data_02197434[a0].f4c. */

extern char data_02197434[];
extern char data_0219747c[];

void *func_02022608(int a0, int *a1) {
    if (*(int *)(data_0219747c + (a0 << 4)) < 0) return 0;
    if (a1 != 0) {
        *a1 = *(int *)(data_02197434 + (a0 << 4) + 0x48);
    }
    return (void *)(data_02197434 + 0x4c + (a0 << 4));
}
