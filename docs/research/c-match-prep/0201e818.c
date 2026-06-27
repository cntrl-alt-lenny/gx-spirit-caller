/* CAMPAIGN-PREP candidate for func_0201e818 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Q12 smull rounding (prod+0x800)>>12 via long long; signed-short table; negate m[2] via rsb
 *   risk:       permuter-class: the four smull/adds#0x800/adc/orr-lsl#0x14/mov-lsr#0xc sequences are heavily interleaved (out[0] and out[3] stores deferred past later smulls); mwcc's 64-bit lowering + scheduling won't match this hand interleave — expect a permuter run.
 *   confidence: low
 */
/* func_0201e818 (main, class D) — build a Q12 fixed-point 2x2 rotation matrix.
 * func_0208bf8c(angle) returns a Q12 scalar (c=r4 from arg0, s2=r0 from r7).
 * sin/cos table data_020bef80 is shorts; idx = ((angle2>>4)<<1), loads
 * tbl[idx*2] (=cos lr) and tbl[(idx+1)*2] (=sin r2) as signed halfwords.
 * Each matrix entry = (smull(coef, scalar) + 0x800) >> 12 (Q12 round), packed
 * 64-bit then truncated; m[2] is negated (rsb). Stores r5[0..3]. */
extern int func_0208bf8c(int angle);
extern short data_020bef80[];

void func_0201e818(int angle0, int angle1, int idxsrc, int *out) {
    int c  = func_0208bf8c(angle0);
    int s2 = func_0208bf8c(angle1);
    int base = (idxsrc >> 4) << 1;
    short sn = data_020bef80[base + 1];
    short cs = data_020bef80[base];
    out[0] = (int)(((long long)cs * c + 0x800) >> 12);
    out[1] = (int)(((long long)sn * c + 0x800) >> 12);
    out[2] = -(int)(((long long)sn * s2 + 0x800) >> 12);
    out[3] = (int)(((long long)cs * s2 + 0x800) >> 12);
}
