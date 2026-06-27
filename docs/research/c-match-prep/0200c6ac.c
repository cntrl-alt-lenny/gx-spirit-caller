/* CAMPAIGN-PREP candidate for func_0200c6ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     c65c clone at offset 0x70; set?-1:0; flags|(1<<bit) / flags&~(1<<bit)
 *   risk:       same as c65c: set?-1:0 select sequence and mov#1 hoist are the likely diffs; offset 0x70 struct-guessed. reshape-able (ternary<->if-assign).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0200c6ac (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     bit set/clear clone of c65c, flags word at offset 0x70
 *   risk:       see risk note
 */
/* func_0200c6ac: set/clear bit 'bit' of the flags word at +0x70; negative bit
   broadcasts set across all bits; return 1. */

int func_0200c6ac(void *a, int bit, int set)
{
    int *flags = (int *)((char *)a + 0x70);
    if (bit < 0) {
        *flags = set ? -1 : 0;
    } else if (set) {
        *flags = *flags | (1 << bit);
    } else {
        *flags = *flags & ~(1 << bit);
    }
    return 1;
}
