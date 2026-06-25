/* CAMPAIGN-PREP candidate for func_02078d30 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BE word->byte unpack do-while + (n>>2)==0 guard
 *   risk:       dst+=4 placement vs indexed strb, and counter materialization (lr) may reorder; low overall
 *   confidence: high
 */
/* func_02078d30: big-endian word->byte unpack. Reads nbytes/4 words
 * from src (post-inc), writes each as 4 big-endian bytes to dst.
 * (nbytes>>2)==0 early-outs. Counter is the word index.
 */

void func_02078d30(unsigned char *dst, const unsigned int *src, unsigned int nbytes) {
    unsigned int n = nbytes >> 2;
    unsigned int i = 0;
    if (n == 0) return;
    do {
        unsigned int w = *src++;
        dst[0] = (unsigned char)(w >> 24);
        dst[1] = (unsigned char)(w >> 16);
        dst[2] = (unsigned char)(w >>  8);
        dst[3] = (unsigned char)w;
        i++;
        dst += 4;
    } while (i < n);
}
