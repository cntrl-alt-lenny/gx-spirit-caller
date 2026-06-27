/* CAMPAIGN-PREP candidate for func_02072444 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod + or-operand-order: signed /8 magic; hw = b1 | (b2<<8); branch-table on tag
 *   risk:       the /8 must emit the signed asr+lsr#30 magic — needs the masked byte typed signed int (an unsigned >>3 gives plain lsr#3); also tag dispatch order/branch layout may differ; mwcc may reorder cmp chain -> reshape-able (force signed int divide; keep case order 0,1,2)
 *   confidence: med
 */
/* func_02072444: TLV byte-parser over a record, extracting one halfword.
 *   s->0x2e = 0x218 (default)
 *   n = ((p->0xc & 0xf0) / 8) - 20            ; signed /8 magic
 *   r3 = &p->0x14 (TLV cursor); ip = n - 1
 *   if (n==0) return
 *   loop over TLVs: tag 0 -> stop; tag 1 -> skip-to-tail;
 *     tag 2 -> hw = b[2]<<8 | b[1]; s->0x2e = hw; advance 3;
 *     default -> len = b[0]; advance (len-1)
 *   counted by ip (bytes remaining), decremented per consumed chunk.
 */

void func_02072444(unsigned char *p, unsigned char *s) {
    int n, rem;
    unsigned char *q;
    *(unsigned short *)(s + 0x2e) = 0x218;
    n = (int)((unsigned)(p[0xc] & 0xf0)) / 8 - 0x14;
    q = p + 0x14;
    rem = n - 1;
    if (n == 0) return;
    for (;;) {
        unsigned int tag = *q++;
        if (tag == 0) return;
        if (tag != 1) {
            if (tag == 2) {
                unsigned int lo = q[1];
                unsigned int hi = q[2];
                q += 3;
                rem -= 3;
                *(unsigned short *)(s + 0x2e) = (unsigned short)(lo | (hi << 8));
            } else {
                unsigned int adv = q[0] - 1;
                rem -= adv;
                q += adv;
            }
        }
        if (rem == 0) return;
        rem -= 1;
    }
}
