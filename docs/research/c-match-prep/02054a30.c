/* CAMPAIGN-PREP candidate for func_02054a30 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shared loop counter; signed-char asr shifts; ordered out[] stores
 *   risk:       reshape-able: orig loads the stack temp with ldrb yet shifts asr; signed-char tmp gives ldrsb+asr (load-instr mismatch). Toggle tmp signedness / add a mask to flip ldrsb->ldrb while keeping asr.
 *   confidence: med
 */
/* func_02054a30 (main, class D) — base64-encode up to 3 input bytes (count r2)
 * into 4 output chars. Copy n<=3 signed bytes to a stack temp, zero-pad to 3,
 * then the canonical 6-bit pack with arithmetic right shifts.
 *   out[0]= in[0]>>2
 *   out[1]= ((in[0]&3)<<4) | (in[1]>>4)
 *   out[2]= ((in[1]&0xf)<<2) | (in[2]>>6)
 *   out[3]= in[2]&0x3f
 * STORE-ORDER recipe: emit the four out[] stores in order; shifts are asr (signed).
 */

void func_02054a30(const signed char *src, signed char *out, int count) {
    signed char tmp[3];
    int i;

    for (i = 0; i < count; i++)
        tmp[i] = src[i];
    for (; i < 3; i++)
        tmp[i] = 0;

    out[0] = tmp[0] >> 2;
    out[1] = ((tmp[0] & 3) << 4) | (tmp[1] >> 4);
    out[2] = ((tmp[1] & 0xf) << 2) | (tmp[2] >> 6);
    out[3] = tmp[2] & 0x3f;
}
