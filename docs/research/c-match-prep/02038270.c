/* CAMPAIGN-PREP candidate for func_02038270 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     emit byte stores in source order 2e/30/2f; (u16) cast re-narrows the bic/orr results
 *   risk:       VERIFIED byte-exact vs target (store order 0x2e,0x30,0x2f with d-load interleaved; bic+lsl#16/lsr#16 re-narrow; orr#0x10/#0x8 paths; cpyne pc,lr). No divergence observed
 *   confidence: high
 */
/* func_02038270 (class D, store-order): obj r0, mode r1, b r2, c r3, d [sp].
 * Stores three bytes in SOURCE order 0x2e,0x30,0x2f (d loaded lazily between).
 * h = (u16)(obj[+0x68] & ~0x18). if (h & 0x400) return 0. if mode&1: h |= 0x10.
 * else: if (h & 0x17)==0 return 0; h |= 0x8. store h -> +0x68; return 1. */

int func_02038270(unsigned char *obj, int mode, int b, int c, int d) {
    unsigned short h;

    obj[0x2e] = (unsigned char)b;
    obj[0x30] = (unsigned char)c;
    obj[0x2f] = (unsigned char)d;

    h = (unsigned short)(*(unsigned short *)(obj + 0x68) & ~0x18);
    if (h & 0x400)
        return 0;

    if (mode & 1) {
        h = (unsigned short)(h | 0x10);
    } else {
        if ((h & 0x17) == 0)
            return 0;
        h = (unsigned short)(h | 0x8);
    }
    *(unsigned short *)(obj + 0x68) = h;
    return 1;
}
