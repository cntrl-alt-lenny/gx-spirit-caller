/* CAMPAIGN-PREP candidate for func_0202b3d4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     DIVMOD: signed n/32 -> plain '/32' (smull-free asr magic); bit = (w>>(n&31))&1
 *   risk:       reshape-able: mwcc must emit n/32 as asr#4;add n,(>>>27);asr#5 (its signed-/32 idiom). If it instead uses asr#31;lsr#27 or a smull magic, the 3-instr index sequence diverges; word vs bit placement is fixed.
 *   confidence: med
 */
/* func_0202b3d4 (main, class D): get bit n of a bitset filled by func_0202b360
 * into an 8-byte (2-word) stack buffer. word = buf[n/32] (signed divide -> the
 * asr#4;+lsr#27;asr#5 magic), bit = (word >> (n & 31)) & 1. n is the SIGNED
 * arg1; a0 (arg0) is passed through to func_0202b360 unchanged. */
extern void func_0202b360(int a0, void *buf);

int func_0202b3d4(int a0, int n) {
    int buf[2];

    func_0202b360(a0, buf);
    return (buf[n / 32] >> (n & 0x1f)) & 1;
}
