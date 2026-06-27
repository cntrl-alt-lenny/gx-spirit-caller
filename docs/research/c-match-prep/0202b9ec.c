/* CAMPAIGN-PREP candidate for func_0202b9ec (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     DIVMOD: signed n%2 (rsb/ror idiom, not &1) selects nibble; n/2 signed; byte[n/2]
 *   risk:       reshape-able: the parity test must come from signed 'n % 2' to emit mov lsr#31;rsb;adds ror#31; writing 'n & 1' yields a plain 'and' and breaks the branch. n/2 signed-divide form is the second risk.
 *   confidence: med
 */
/* func_0202b9ec (main, class D): n = func_0202b0b4(a0); read packed-nibble
 * byte data_02105bc0[n/2]; return the low nibble if n even, high nibble if odd.
 * The 'n even?' test uses SIGNED n%2 (the rsb/ror idiom, NOT n&1); n/2 is the
 * signed divide (add n,(n>>>31); asr#1). a0 (arg0) passed through to b0b4. */
extern int func_0202b0b4(int a0);
extern unsigned char data_02105bc0[];

int func_0202b9ec(int a0) {
    int n = func_0202b0b4(a0);
    unsigned char byte = data_02105bc0[n / 2];

    if (n % 2 == 0)
        return byte & 0xf;
    return (byte & 0xf0) >> 4;
}
