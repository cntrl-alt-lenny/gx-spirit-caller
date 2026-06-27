/* CAMPAIGN-PREP candidate for func_02078e3c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind sbox base r7; if-assign keypos wrap; store-order swap kept
 *   risk:       orig holds const 0 in a reg for `movge r5,r0`; mwcc likely emits `movge r5,#0` (immediate) -> 1-encoding diff on the keypos-wrap. reshape-able (set kp=zero-local) but marginal.
 *   confidence: med
 */
/* func_02078e3c: RC4 KSA. r0=state, r1=key, r2=keylen.
 * state layout: [0]=i, [1]=j, [2..257]=S[256] (the byte sbox at r0+2).
 * Loop1: S[k]=k for k in 0..255.
 * Loop2 (KSA): i=0..255, key pos kp wraps to keylen, j accum &0xff.
 *   j = (j + S[i] + key[kp]) & 0xff;  swap S[i],S[j]; kp=(kp+1)&0xff; if(kp>=keylen) kp=0;
 */
typedef struct {
    unsigned char i;       /* +0x0 */
    unsigned char j;       /* +0x1 */
    unsigned char s[256];  /* +0x2 */
} rc4_state;

void func_02078e3c(rc4_state *st, const unsigned char *key, int keylen) {
    int k;
    int kp;
    int j;
    unsigned char *s = st->s;

    st->i = 0;
    st->j = 0;
    for (k = 0; k < 0x100; k++) {
        s[k] = (unsigned char)k;
    }

    kp = 0;
    j = 0;
    for (k = 0; k < 0x100; k++) {
        unsigned char si = s[k];
        unsigned char kb = key[kp];
        kp = (kp + 1) & 0xff;
        j = (j + (si + kb)) & 0xff;
        s[k] = s[j];
        if (kp >= keylen) kp = 0;
        s[j] = si;
    }
}
