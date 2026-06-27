/* CAMPAIGN-PREP candidate for func_020b1d80 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     double->int64 exponent/shift extract; 0x43e bias; branch ladder e>0x20 split
 *   risk:       permuter-class/struct-guessed: deep soft-float shift sequence; the negative-branch cmn;cmpeq;bhi unsigned-overflow test and the e-relative two-word shift (orr ip,lsl r2 / rsb #0x20) are exact ARM idioms a C rewrite won't reproduce instruction-for-instruction; likely escapes to .s.
 *   confidence: low
 */
/* double (hi:lo) -> signed long long, soft-float, addr 020b1d80 */
long long func_020b1d80(unsigned int lo, unsigned int hi)
{
    unsigned int sh;
    unsigned int mant;

    if ((hi & 0x80000000) == 0) {
        int e = (int)(0x43e - (hi >> 0x14));
        if (e < 0) {
            return (long long)(unsigned long long)0xffffffffffffffffULL; /* mvn r0; mvn r1 */
        }
        if (e >= 0x40) {
            return 0;
        }
        mant = (hi << 0xb) | 0x80000000 | (lo >> 0x15);
        if (e > 0x20) {
            unsigned int s = (unsigned int)(e - 0x20);
            return (long long)(unsigned long long)((unsigned long long)(mant >> s));
        } else {
            unsigned int r3 = lo << 0xb;
            unsigned int outlo = (r3 >> e) | (mant << (0x20 - e));
            unsigned int outhi = mant >> e;
            return (long long)(((unsigned long long)outhi << 32) | outlo);
        }
    } else {
        if (((hi + 0x100000) == 0 ? (lo == 0) : ((hi + 0x100000) > 0x0)) ) {
            /* cmn r1,#0x100000; cmpeq r0,#0; bhi -> overflow path */
            return (long long)(unsigned long long)0xffffffffffffffffULL;
        }
        return 0;
    }
}
