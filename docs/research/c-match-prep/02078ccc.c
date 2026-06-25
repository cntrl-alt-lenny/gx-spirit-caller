/* CAMPAIGN-PREP candidate for func_02078ccc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BE byte->word pack do-while + n==0 guard + orr-shift chain
 *   risk:       final orr operand order (b3 first) is commutative-reassoc; index vs 4 pointers and temp reg-alloc may flip
 *   confidence: med
 */
/* func_02078ccc: big-endian byte->word pack. Reads nbytes from src as
 * groups of 4 bytes, packs each (b0<<24|b1<<16|b2<<8|b3), and writes
 * words through dst++ . nbytes is an unsigned byte count (loop steps
 * the byte index by 4 and compares against it); n==0 early-outs.
 */

void func_02078ccc(unsigned int *dst, const unsigned char *src, unsigned int nbytes) {
    unsigned int i = 0;
    if (nbytes == 0) return;
    do {
        *dst++ = ((unsigned int)src[i]     << 24) |
                 ((unsigned int)src[i + 1] << 16) |
                 ((unsigned int)src[i + 2] <<  8) |
                  (unsigned int)src[i + 3];
        i += 4;
    } while (i < nbytes);
}
