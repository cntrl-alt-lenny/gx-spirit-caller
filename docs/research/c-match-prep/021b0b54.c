/* CAMPAIGN-PREP candidate for func_021b0b54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Signed (pos-0x36)/32 word, %32 bit; |=1<<bit set / &=~(1<<bit) clear; <0x35 plain store
 *   risk:       reshape-able: asm uses signed div/mod magic (asr#5 word, rsb/ror remainder). If mwcc picks a different reciprocal seq, try n>>5 with explicit (n&0x1f) bit; div/mod form should match.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b0b54 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: signed /32 + %32 divmod on (pos-0x36) to
 * address a word bitset; set path uses |= 1<<bit, clear path uses &= ~(1<<bit).
 * pos<0x35 short-circuits to a plain word store. The asr-based word index and
 * the rsb/ror remainder dance are exactly mwcc's signed n/32, n%32 lowering.
 */
extern int data_ov002_022cd31c[];   /* A: plain word array (small index)   */
extern int data_ov002_022cd3f0[];   /* B: word bitset (large index)        */

void func_ov002_021b0b54(int pos, int val) {
    int n;
    if (pos < 0x35) {
        data_ov002_022cd31c[pos] = val;
        return;
    }
    n = pos - 0x36;
    if (val != 0) {
        data_ov002_022cd3f0[n / 32] |= 1 << (n % 32);
    } else {
        data_ov002_022cd3f0[n / 32] &= ~(1 << (n % 32));
    }
}
