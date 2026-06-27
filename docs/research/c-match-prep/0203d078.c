/* CAMPAIGN-PREP candidate for func_0203d078 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store f1 before computing f2 (r0 reuse); int v => ASR shift; store f1,f2,f3 order
 *   risk:       store-order: orig emits strb f1 before the f2 compute (forced by r0 reuse); if mwcc reorders the f1 store after, diverges. reshape-able (it falls out of r0 reuse). asr-vs-lsr same as sibling. Offsets struct-guessed.
 *   confidence: med
 */
/* func_0203d078 (cls D): sibling of 0203cff8, unconditional 3-field pack store.
 * Store order: f1=(u8)arg0 FIRST (before computing f2, since r0 is reused for the
 * shift), then f2 (arith-shift from arg1->f2), then f3 (7-bit merge), then Copy32.
 * base = arg3+0x46c (0x46c pooled, not rotatable). Copy32 dest = arg3+0xbf0. */

extern void Copy32(void *src, void *dst, int size);

void func_0203d078(int arg0, unsigned short *arg1, int arg2, char *arg3) {
    unsigned char *base = (unsigned char*)(arg3 + 0x46c);
    int v = arg1[1];                                   /* arg1->f2 (u16 -> int) */
    int n;
    base[1] = (unsigned char)arg0;                     /* store f1 first */
    if (v & 2)
        n = (v >> 2) & 0xff;
    else
        n = ((v >> 2) + 0x19) & 0xff;
    base[2] = (unsigned char)n;                         /* store f2 */
    base[3] = (unsigned char)((base[3] & ~0x7f) | (arg2 & 0x7f)); /* store f3 */
    Copy32(arg1, arg3 + 0xbf0, 0xc0);
}
