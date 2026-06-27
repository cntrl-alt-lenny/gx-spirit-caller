/* CAMPAIGN-PREP candidate for func_02008c84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: n/32 word, n%32 shift; base bound in r4 across call; mask/insert store-order
 *   risk:       struct-guessed: data_02105bb0 modeled as [][8] (rec*8-word stride) and p held across func_02008c10 (callee-saved r4) — if the [8] inner dim or element type is wrong the add r4,r3,r0,lsl#3 base diverges. Confirm record stride.
 *   confidence: med
 */
extern unsigned int data_02105bb0[][8];
extern void func_02008c10(int);

void func_02008c84(int rec, int n, int val)
{
    unsigned int *p = data_02105bb0[rec];
    func_02008c10(rec);
    p[n / 32] = (p[n / 32] & ~(1 << (n % 32))) | (val << (n % 32));
}
