/* CAMPAIGN-PREP candidate for func_02073fc8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     htons fold via masks; two parity loops; len-=2/while(>1) loop idiom
 *   risk:       permuter-class: dual-loop strength-reduction + scheduling, plus the even-path swap orig emits as asr#8 (signed-narrow) where mwcc gives lsr#8.
 *   confidence: low
 */
/* func_02073fc8: BSD in_cksum / internet checksum with htons folding.
 * r0=buf, r1=len, r2=running sum (carried in). Returns folded u16.
 * Two paths on pointer parity: odd -> big-endian byte pairs; even ->
 * pre-swap sum, native halfword adds, then 16-bit fold. _LIT 0x00ff00ff /
 * 0xff00ff00 / 0x0000ffff are the swap/fold masks. */
unsigned short func_02073fc8(unsigned char *p, int len, unsigned int sum) {
    if (((unsigned int)p & 1) != 0) {
        while (len > 1) {
            sum += (unsigned short)((p[0] << 8) | p[1]);
            len -= 2;
            p += 2;
        }
    } else {
        sum = (unsigned short)sum;
        sum = (unsigned short)(((sum >> 8) & 0xff) | (sum << 8));
        while (len > 1) {
            sum += *(unsigned short *)p;
            len -= 2;
            p += 2;
        }
        sum = ((sum >> 8) & 0x00ff00ff) | ((sum << 8) & 0xff00ff00);
        sum = (sum >> 16) | (sum << 16);
    }
    if (len != 0) {
        sum += p[0] << 8;
    }
    sum = (sum & 0xffff) + (sum >> 16);
    sum += sum >> 16;
    return (unsigned short)sum;
}
