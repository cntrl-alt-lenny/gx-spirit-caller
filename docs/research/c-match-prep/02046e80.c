/* CAMPAIGN-PREP candidate for func_02046e80 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     callee-save r7..r4=a0..a3; reload g per store (asm re-ldr each); (a0-1)&0xff; stacked 5th arg
 *   risk:       asm reloads data_0219daec for EACH of the 3 stores (str[88],str[8c],strb[2c]) via separate ldr [r1] -- if mwcc binds g once, 2 ldr collapse and diverge. func_02051384 is (idx,0,0,a3,stack=a4): r2=#0 is 3rd, r3=a4(orig r3 saved in r4), stack0=a4(loaded [sp,#0x18]=arg5). reshape-able (reload flip). struct-guessed.
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
extern void func_02051384(u32 a, u32 b, u32 c, u32 d, u32 e);

u32 func_02046e80(u32 a0, u32 a1, u32 a2, u32 a3, u32 a4) {
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
    *(u32 *)(g + 0x88) = a1;
    g = data_0219daec;
    *(u32 *)(g + 0x8c) = a2;
    g = data_0219daec;
    *(u8 *)(g + 0x2c) = 0;
    func_020466f4(5);
    func_02051384((a0 - 1) & 0xff, 0, 0, a3, a4);
    return 1;
}
