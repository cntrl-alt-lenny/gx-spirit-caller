/* CAMPAIGN-PREP candidate for func_0200c65c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit<0 -> set?-1:0; else flags|(1<<bit) / flags&~(1<<bit); flags-first operand order
 *   risk:       the set?-1:0 select (mvnne;moveq) vs an if-assign, and hoisting mov#1 ahead of the branch, are the likely diffs; field offset 0x6c struct-guessed. reshape-able (ternary<->if-assign).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0200c65c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     bit<0 -> flags = set?-1:0 (ternary->movne/moveq); else set bit via 1<<bit / clear via ~(1<<bit)
 *   risk:       see risk note
 */
/* func_0200c65c: set/clear bit 'bit' of the flags word at +0x6c; negative bit
   broadcasts set across all bits; return 1. */

int func_0200c65c(void *a, int bit, int set)
{
    int *flags = (int *)((char *)a + 0x6c);
    if (bit < 0) {
        *flags = set ? -1 : 0;
    } else if (set) {
        *flags = *flags | (1 << bit);
    } else {
        *flags = *flags & ~(1 << bit);
    }
    return 1;
}
