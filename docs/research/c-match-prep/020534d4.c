/* CAMPAIGN-PREP candidate for func_020534d4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sign-bit guard (arg0&0x80000000) OR'd with folded (arg1&0) quirk; long-long compare (s64)(r&0x7f)==(s64)key via asr#31 hi-build
 *   risk:       `and r3,r4,#0x0` is a mask that folds to 0 — mwcc -O4 will constant-fold `arg1 & 0` away, dropping the instruction. Cannot reproduce from clean C. permuter-class / likely .s-escape (folded `&0` guard quirk)
 *   confidence: low
 */
/* func_020534d4: guard on sign bit, build a buffer, compare low-7-bits == key.
 * r0=v, r1=key, r2=aux. The `and r3,r1,#0` guard quirk folds to 0 in clean C
 * (compiler will drop it) — flagged as the divergence.
 */

extern void func_020a68e0(void *dst, int n);
extern int  func_020a6754(void *dst, void *src, int len);

int func_020534d4(unsigned int v, int key, int aux) {
    unsigned char buf[0x100];
    int           in[2];
    int           r;

    if ((key & 0) != 0 || (v & 0x80000000u) != 0)
        return 0;

    in[0] = (int)v;
    in[1] = aux;
    func_020a68e0(buf, 7);
    r = func_020a6754(buf, in, 8);

    if ((long long)(r & 0x7f) == (long long)key)
        return 1;
    return 0;
}
