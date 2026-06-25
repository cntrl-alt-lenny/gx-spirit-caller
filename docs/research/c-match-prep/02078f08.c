/* CAMPAIGN-PREP candidate for func_02078f08 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     strided count-=2 unpack loop, halfword>>8 byte split
 *   risk:       reg-alloc/scheduling of the descending dst + post-inc src loop may reorder; tail strgtb predication may not regenerate
 *   confidence: low
 */
/* func_02078f08: unpack a u16 source array into a byte destination,
 * written in reverse. dst is advanced to its end (dst += n-1), then for
 * each source halfword the low byte is stored at the current position and
 * the (value>>8) byte one slot below, walking dst downward two at a time.
 * Odd trailing element stores one final low byte.
 *
 *   sub r3,r2,#1 ; add r0,r0,r3        -> dst += n-1
 *   loop: ldrh; strb low; strb (asr#8); dst-=2; src+=2; n-=2; while n>1
 *   tail: if (n>0) one more ldrh/strb
 */

void func_02078f08(unsigned char *dst, const unsigned short *src, int n) {
    dst += n - 1;
    while (n > 1) {
        unsigned short h = *src;
        dst[0]  = (unsigned char)h;
        dst[-1] = (unsigned char)((short)h >> 8);
        src++;
        dst -= 2;
        n -= 2;
    }
    if (n > 0) {
        *dst = (unsigned char)*src;
    }
}
