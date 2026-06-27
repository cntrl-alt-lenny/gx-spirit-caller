/* CAMPAIGN-PREP candidate for func_022b03f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: power-of-2 divmod via signed / and %; tst==0 -> if-return.
 *   risk:       Word-index divisor inferred: asm splits asr#4 then asr#5 (looks like /512) but bit uses %32; if mwcc's magic for /0x20 differs, ldr index diverges. struct-guessed/permuter-class.
 *   confidence: low
 */
/* func_ov002_022b03f4 - signed bit-table GET, returns inverted bit (eq->1).
 * cmp#7/#0x70 range guard; word = n/512-style two-stage signed shift
 * (asr#4 ; +bias ; asr#5), bit = n%32 via lsl#0x1b/ror#0x1b; tst#1 -> moveq#1.
 * data_021064a8 is a u32 bit-array. */

extern unsigned int data_021064a8[];

int func_ov002_022b03f4(int n)
{
    unsigned int word;
    if (n <= 7)   return 0;
    if (n >= 0x70) return 0;
    word = data_021064a8[n / 0x20];
    return ((word >> (n % 0x20)) & 1u) == 0;
}
