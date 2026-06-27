/* CAMPAIGN-PREP candidate for func_02076b74 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     constant /3 => smull-magic plain divide; signed cmp len<0x20 (blt); s+0x54-len pointer math
 *   risk:       reshape-able: v3 must be int so /3 inlines smull 0x55555556;add lsr#31 (an unsigned would pick a different magic). 0x20-len/s+0x54-len offsets struct-guessed.
 *   confidence: med
 */
/* func_02076b74: header validate, big-endian u16 /3 (smull 0x55555556),
 * func_02076c5c -> halfword store, then a length-split memcpy: full 0x20
 * copy if len>=0x20 else zero-fill the head (func_020945f4 memset) and copy
 * len bytes ending at s+0x54. r0=s (r6), r1=pkt (r5). */
extern int  func_02076c4c(int a, int b);
extern int  func_02076c5c(void *p, int v, int n);
extern void func_020945f4(void *dst, int v, int n);
extern void func_02094688(void *src, void *dst, int n);

void func_02076b74(unsigned char *s, unsigned char *pkt) {
    int v3, r, ip, len;
    if (func_02076c4c(pkt[0], pkt[1]) == 0) return;
    v3 = pkt[3] + (pkt[2] << 8);
    v3 = v3 / 3;
    r = (unsigned short)func_02076c5c(pkt + 8, v3, 3);
    if (r == 0) return;
    *(unsigned short *)(s + 0x32) = r;
    ip = pkt[5] + (pkt[4] << 8);
    len = pkt[7] + (pkt[6] << 8);
    s[0x30] = 0;
    pkt += 8 + ip;
    if (len < 0x20) {
        func_020945f4(s + 0x34, 0, 0x20 - len);
        func_02094688(pkt, s + 0x54 - len, len);
    } else {
        func_02094688(pkt, s + 0x34, 0x20);
    }
    s[0x455] = 1;
}
