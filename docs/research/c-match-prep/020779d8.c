/* CAMPAIGN-PREP candidate for func_020779d8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: do-while count matches sub r2/bne; guard test before accumulate; acc<<8 operand-order
 *   risk:       Loop trip-count form: orig inits cnt=n-1 then sub/bne (runs n). reshape-able via do{--n}while; if mwcc emits a leading cmp the loop header byte-diverges. reshape-able.
 *   confidence: med
 */
/* func_020779d8 — multi-byte (big-endian) length/varint decode.
 * r0 = pointer-to-pointer into a byte stream; advances *pp by the
 * consumed bytes and returns the accumulated value, or -1 on the
 * 0xFF000000 overflow guard.
 *
 *   ldr r1,[r0]; ldrb r3,[r1]; if(!(c&0x80)) -> store p+1,return 0
 *   n = c & 0x7f; acc=0; loop n times accumulating big-endian bytes,
 *   bailing to -1 if acc would shift a set bit out of bit 24..31.
 */

int func_020779d8(unsigned char **pp) {
    unsigned char *p = *pp;
    unsigned int c = *p;
    unsigned char *q = p + 1;
    unsigned int acc;
    int n;

    if (c & 0x80) {
        n = c & 0x7f;
        acc = 0;
        if (n != 0) {
            do {
                if (acc & 0xff000000u) return -1;
                acc = *q++ + (acc << 8);
            } while (--n != 0);
        }
        *pp = q;
        return (int)acc;
    }
    *pp = q;
    return 0;
}
