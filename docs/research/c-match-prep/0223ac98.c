/* CAMPAIGN-PREP candidate for func_0223ac98 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: a/b decl-order (and r4 first, then r5), signed asr#8 for high byte, mla index a*1+b*0x14, (w<<19)>>19 single bitfield
 *   risk:       reshape-able + struct-guessed: a(r4) and b(r5) are callee-saved across 3 calls; declare a before b so r4/r5 bind in that order. If swapped the mov r1/r2 args invert. mla form (and r2,#1 ; mla then mla r0,r5,#0x14) offset uncertain.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_0202b8f0(int a);
extern int func_ov002_021de4d8(int a, int b, int c);
extern int func_ov002_021df818(int a, int b, int c);
extern int func_ov002_021e2b3c(void);
extern int func_ov002_021e2c5c(void);
extern int func_ov002_0223de94(int a, int b);
extern int func_ov002_0223df38(int a, int b, int c);
extern int func_ov002_0225764c(int a, int b, int c);

int func_ov002_0223ac98(int *self) {
    if (func_ov002_0223df38(0, 0, (int)self) == 0) return 0;
    {
        int r = func_ov002_0223de94((int)self, 0);
        int a = r & 0xff;
        int b = (((u16)(r << 16) >> 16) >> 8) & 0xff;   /* (r<<16)>>16 then asr#8 then &0xff */
        if (func_ov002_0225764c((int)self, a, b) == 0) return 0;
        func_ov002_021e2b3c();
        if (func_ov002_021de4d8((int)self, a, b) != 0) {
            int parity = a & 1;
            u8 *p = data_ov002_022cf16c + parity * 0x868;
            u32 w = *(u32*)(p + b * 0x14 + 0x30);
            int arg = (w << 19) >> 19;                  /* (w<<19)>>19 */
            int c = func_0202b8f0(arg);
            u16 h2 = *(u16*)((char*)self + 2);
            func_ov002_021df818((int)self, 1 - (h2 & 1), c);
        }
        func_ov002_021e2c5c();
    }
    return 0;
}
