/* CAMPAIGN-PREP candidate for func_022018cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: callee-saved a/b/c (r6/r5/r4); base+(b&1)*0x868+c*0x14+0x30; slot low13 mask; store-order flag=1;call;flag=0
 *   risk:       reshape-able: store-order around the call is natural in C. Risk is the packed (b&0xff)|((c&0xff)<<8) u16 compare and that r0 still=a feeds func_0223de94(a,0) implicitly. struct-guessed: 0x30/stride + 0x5c4 flag offset.
 *   confidence: med
 */
/* func_ov002_022018cc (ov002, class D) - direct table walk (a,b,c args) to slot[+0x30] low13 gate; then flag-store-bracketed call.
 * Flag at ce288+0x5c4 set 1 before func_022575c8 and 0 after - store order load-bearing. b,c packed key compared to func_0223de94(a,0). */
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022ce288[];
extern int func_ov002_0223de94(int a, int b);
extern int func_ov002_022575c8(int a, int b, int c);

int func_ov002_022018cc(int a, int b, int c) {
    unsigned int sw;
    int ret;
    if (a == 0) return 0;
    sw = *(unsigned int *)(data_ov002_022cf16c + (b & 1) * 0x868 + c * 0x14 + 0x30);
    if ((sw & 0x1fff) == 0) return 0;
    if (func_ov002_0223de94(a, 0) == (int)(unsigned short)((b & 0xff) | ((c & 0xff) << 8))) return 0;
    *(int *)(data_ov002_022ce288 + 0x5c4) = 1;
    ret = func_ov002_022575c8(a, b, c);
    *(int *)(data_ov002_022ce288 + 0x5c4) = 0;
    return ret;
}
