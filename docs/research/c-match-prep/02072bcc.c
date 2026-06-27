/* CAMPAIGN-PREP candidate for func_02072bcc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order + shifted-or-first: bswap (x>>8)|(x<<8) asr-first; 0xe before 0x10
 *   risk:       orig RELOADS data_0219ef1c word for the second halfword (ldr [r3] twice); mwcc may CSE to one load — reshape-able by reading via two u16 lvalues. Secondary: arg-order of func_02094688 (dst vs src) is struct-guessed from usage
 *   confidence: med
 */
/* func_02072bcc: fill a header struct then memcpy regions, byteswapping
 * two halfwords from data_0219ef1c into +0xe and +0x10 (in that order).
 *
 *   s->0x6 = 0x200
 *   memcpy(s+0x8, s+0x12, 0xa)
 *   memcpy(s+0x8, data_0219ef2c, 0x6)
 *   w = *data_0219ef1c
 *   s->0xe  = bswap16((u16)(w>>16))
 *   s->0x10 = bswap16((u16)w)
 *   memcpy(s+0x12, data_0219ef2c, 0x6)
 *   func_02073d30(s-0xe, 0x2a, 0, 0)
 */

extern unsigned char data_0219ef1c[];
extern unsigned char data_0219ef2c[];
extern void *func_02094688(void *dst, void *src, int n);
extern void func_02073d30(void *a, int b, int c, int d);

void func_02072bcc(unsigned char *s) {
    unsigned long w;
    int hh, lh;
    *(unsigned short *)(s + 0x6) = 0x200;
    func_02094688(s + 0x8, s + 0x12, 0xa);
    func_02094688(data_0219ef2c, s + 0x8, 0x6);
    w = *(unsigned long *)data_0219ef1c;
    hh = (int)(unsigned short)(w >> 16);
    *(unsigned short *)(s + 0xe) = (unsigned short)((hh >> 8) | (hh << 8));
    lh = (int)(unsigned short)w;
    *(unsigned short *)(s + 0x10) = (unsigned short)((lh >> 8) | (lh << 8));
    func_02094688(data_0219ef2c, s + 0x12, 0x6);
    func_02073d30(s - 0xe, 0x2a, 0, 0);
}
