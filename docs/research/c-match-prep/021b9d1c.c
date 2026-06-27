/* CAMPAIGN-PREP candidate for func_021b9d1c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     read b before a (decl-order); shifted-or lo|(hi<<8) operand-first; (u16) cast = lsl16;lsr16 zero-extend
 *   risk:       reshape-able: read order b-then-a is the lever (orig ldrh [r1] precedes [r0]); if mwcc reads a first the two ldrh swap. (u16) subtract must not become ldrsh -- read via unsigned short*.
 *   confidence: med
 */
/* func_ov006_021b9d1c: byteswap two u16s and subtract -- comparator variant of
 * 021b9c88/021b9000 with a 16-bit endian flip on each operand.
 *
 *   ldrh ip,[r1] (b first) ; ldrh r3,[r0] (a)
 *   bswap(x) = ((x>>8)&0xff) | ((x&0xff)<<8)
 *   return (u16)bswap(a) - (u16)bswap(b)   (lsl#16;lsr#16 = zero-extend)
 */

int func_ov006_021b9d1c(unsigned short *a, unsigned short *b) {
    unsigned int bb = *b;
    unsigned int aa = *a;
    unsigned int sb = ((bb >> 8) & 0xff) | ((bb & 0xff) << 8);
    unsigned int sa = ((aa >> 8) & 0xff) | ((aa & 0xff) << 8);
    return (unsigned short)sa - (unsigned short)sb;
}
