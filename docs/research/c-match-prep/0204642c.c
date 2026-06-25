/* CAMPAIGN-PREP candidate for func_0204642c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs guard a0==0; reload g after calls; blx tail with arg2 from g->74
 *   risk:       asm loads r2=[g+0x74] BEFORE blx r3 (3rd arg in r2) yet only a0,a1 are passed in r0,r1 -- fp is fp(a0,a1,g->74); my (void)c is wrong, must pass it as 3rd arg. Also tail returns r5(a0) not a value. reshape-able once signature fixed. struct-guessed.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef void (*Fp2)(u32 a, u32 b);

extern u8 *data_0219daec;
extern void func_020466f4(int a);
extern void func_020490dc(void);

u32 func_0204642c(u32 a0, u32 a1) {
    u8 *g;
    Fp2 fp;
    if (a0 == 0) {
        g = data_0219daec;
        *(u32 *)(g + 0x64) = a1;
        func_020466f4(3);
        func_020490dc();
    } else {
        func_020466f4(0);
    }
    g = data_0219daec;
    fp = *(Fp2 *)(g + 0x70);
    if (fp == 0) {
        return 0;
    }
    {
        u32 c = *(u32 *)(g + 0x74);
        fp(a0, a1);
        (void)c;
    }
    return ???;
}
