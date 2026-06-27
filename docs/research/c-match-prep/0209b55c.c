/* CAMPAIGN-PREP candidate for func_0209b55c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: BCD validate loop (>=10->0) then place-value mla accumulate
 *   risk:       both loops hold a separate +4 shift accumulator distinct from the index; as i*4 mwcc -O4 may strength-reduce to the matching +4 IV OR keep i,lsl#2 (add/shift pairing diverges); loop-2 computes place*10 before the mla. reshape-able (explicit shift var) / permuter-class for schedule.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209b55c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     8-nibble BCD validate loop (>=10 -> return 0), then place-value accumulate (acc += nibble*place; place*=10)
 *   risk:       both loops keep a separate +4 shift accumulator (r2/lr) distinct from the i counter; written as i*4 here, mwcc -O4 usually strength-reduces to the same +4 IV but may instead keep i,lsl#2 -> the per-iter add/shift pairing diverges. reshape-able (introduce explicit shift var) / permuter-class for the mul/mla schedule.
 *   confidence: med
 */
/* func_0209b55c: packed 8-digit BCD -> binary. First validates each nibble
 * < 10 (else returns 0), then accumulates digit*place (low nibble first). */

int func_0209b55c(unsigned int value) {
    int i;
    int acc;
    int place;
    int j;
    for (i = 0; i < 8; i++) {
        if (((value >> (i * 4)) & 0xf) >= 0xa)
            return 0;
    }
    acc = 0;
    place = 1;
    for (j = 0; j < 8; j++) {
        acc += ((value >> (j * 4)) & 0xf) * place;
        place = place * 10;
    }
    return acc;
}
