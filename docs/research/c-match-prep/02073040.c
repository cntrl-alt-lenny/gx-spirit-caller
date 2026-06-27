/* CAMPAIGN-PREP candidate for func_02073040 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order + byteswap: ordered halfword stores; seq++ RMW; bswap (c>>8)|(c<<8)
 *   risk:       struct-guessed: the func_02073fc8 call chain/args (one or two calls, which operands) and func_020730fc's 6 args/stack layout are inferred from reg moves — high chance arg wiring diverges; also store-order of h[+2]/h[+4]/h[+6] must stay as written
 *   confidence: low
 */
/* func_02073040: build a response header at (arg2->0x4c)+0x22, bumping a
 * global sequence counter and byteswapping a checksum into +0x2.
 *
 *   h = arg2->0x4c + 0x22
 *   h[0]   = 0x8                 ; strh #8 at base 0x22
 *   h[+4]  = ((u32)data_021a63d0[1]) (halfword)
 *   h[+2]  = 0
 *   seq = *(u16)data_0219eecc
 *   arg2->0xa = seq; *(u16)data_0219eecc = seq+1; h[+6] = seq
 *   t = func_02073fc8(h, ...)
 *   v = func_02073fc8(arg0, arg1, t)
 *   c = func_02073fac((u16)v)
 *   h[+2] = bswap16(c)
 *   func_020730fc(h, 8, arg0, arg1, arg2->0x1c, 1)
 */

extern unsigned char data_0219eecc[];
extern unsigned char data_021a63d0[];
extern int func_02073fc8(int a, int b, int c);
extern unsigned int func_02073fac(unsigned int x);
extern void func_020730fc(void *h, int n, int a0, int a6, int extra, int one);

void func_02073040(int arg0, int arg1, unsigned char *arg2) {
    unsigned char *base = *(unsigned char **)(arg2 + 0x4c);
    unsigned char *h = base + 0x22;
    unsigned short seq;
    int v, c;
    *(unsigned short *)(base + 0x22) = 8;
    *(unsigned short *)(h + 4) = (unsigned short)*(unsigned long *)(data_021a63d0 + 4);
    *(unsigned short *)(h + 2) = 0;
    seq = *(unsigned short *)data_0219eecc;
    *(unsigned short *)(arg2 + 0xa) = seq;
    *(unsigned short *)data_0219eecc = seq + 1;
    *(unsigned short *)(h + 6) = seq;
    v = func_02073fc8((int)h, func_02073fc8((int)h, 0), 0);
    v = func_02073fc8(arg0, arg1, v);
    c = (int)func_02073fac((unsigned int)(unsigned short)v);
    *(unsigned short *)(h + 2) = (unsigned short)(((c >> 8) & 0xff) | (c << 8));
    func_020730fc(h, 8, arg0, arg1, *(int *)(arg2 + 0x1c), 1);
}
