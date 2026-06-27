/* CAMPAIGN-PREP candidate for func_02076ad0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /2 => v/2 (add;asr#1); store-in-condition for movs+strneb; r5/pkt held across calls
 *   risk:       reshape-able: v/2 must stay int to emit add r1,r1,lsr#31;asr#1 (not lsr). struct offsets 0x34/0x74/0x30/0x32/0x455 struct-guessed.
 *   confidence: med
 */
/* func_02076ad0: validate header (func_02076c4c), memcpy 0x20 payload to
 * s+0x34, conditional second copy to s+0x74, then a big-endian u16 read
 * /2 (asr#1 rounding) fed to func_02076c5c, halfword-store result, flag.
 * r0=s (dst struct, callee-saved r4), r1=pkt (callee-saved r6). */
extern int  func_02076c4c(int a, int b);
extern int  func_02076c5c(void *p, int v, int n);
extern void func_02077db0(void *s);
extern void func_02094688(void *src, void *dst, int n);

void func_02076ad0(unsigned char *s, unsigned char *pkt) {
    int r5;
    int v;
    if (func_02076c4c(pkt[0], pkt[1]) == 0) return;
    func_02094688(pkt + 2, s + 0x34, 0x20);
    r5 = pkt[0x22];
    pkt += 0x23;
    if (r5 != 0x20) {
        s[0x30] = 0;
    } else {
        func_02094688(pkt, s + 0x74, 0x20);
        func_02077db0(s);
    }
    v = pkt[r5 + 1] + (pkt[r5] << 8);
    v = v / 2;
    if ((*(unsigned short *)(s + 0x32) = (unsigned short)func_02076c5c(pkt + r5 + 2, v, 2)) != 0)
        s[0x455] = 1;
}
