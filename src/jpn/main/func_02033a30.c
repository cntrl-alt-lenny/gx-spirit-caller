/* CAMPAIGN-PREP candidate for func_02033a30 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: s8 counter (signed char) -> lsl#24;asr#24 sign-extend pair
 *   risk:       Counter must stay signed char so the `i<<24>>24` re-extension appears each iter; if mwcc promotes i to int the asr pair vanishes. Reshape-able by forcing signed-char width; loop-shape/cmp-order may still differ (permuter-class).
 *   confidence: med
 */
/* func_02033a30: linear search of a strided table for a signed-byte key.
 * limit = (s8)p[3]; list = *(s8**)(p+0xc). Walk entries (stride 4 bytes),
 * reading (s8)*entry; return the index where it equals `key`, else -1.
 * The counter is kept as an s8 (orig: lsl#24;asr#24 each step) and compared
 * against the s8 limit, so use signed char locals for both.
 */
int func_02033a30(signed char *p, int key) {
    signed char *list = *(signed char **)(p + 0xc);
    signed char limit = p[3];
    signed char i = 0;
    if (limit <= 0) goto fail;
    for (;;) {
        if (key == *list) return i;
        i++;
        list += 4;
        if (!(limit > i)) goto fail;
    }
fail:
    return -1;
}
