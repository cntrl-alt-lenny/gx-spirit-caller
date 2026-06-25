/* CAMPAIGN-PREP candidate for func_02046f24 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     callee-save a0..a3; reload g per store (str[80],str[84]); (a0-1)&0xff; two stacked args a4,a5
 *   risk:       asm reloads data_0219daec separately for str[0x80] and str[0x84] -- bind-once would drop one ldr. func_0205142c arg map: r0=(a0-1)&0xff, r1=a1, r2=#0, r3=#0, stack0=[sp+0x20]=a5? stack1=[sp+0x24]=a6 -- 5th/6th args are the two incoming stacked args, easy to mis-pair. reshape-able. struct-guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 *data_0219daec;
extern u32 func_02045280(void);
extern void func_02046254(void);
extern void func_020466f4(int a);
extern void func_020467f4(void);
extern void func_0205142c(u32 a, u32 b, u32 c, u32 d, u32 e, u32 f);

u32 func_02046f24(u32 a0, u32 a1, u32 a2, u32 a3, u32 a4, u32 a5) {
    u8 *g;
    if (func_02045280() == 0) {
        g = data_0219daec;
        if (*(u32 *)(g + 0x24) != 3) {
            return 0;
        }
    } else {
        return 0;
    }
    func_020467f4();
    g = data_0219daec;
    *(u32 *)(g + 0x80) = a2;
    g = data_0219daec;
    *(u32 *)(g + 0x84) = a3;
    func_020466f4(5);
    func_0205142c((a0 - 1) & 0xff, a1, 0, 0, a4, a5);
    return 1;
}
