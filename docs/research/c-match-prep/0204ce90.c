/* CAMPAIGN-PREP candidate for func_0204ce90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r5=arg held; reload getter; 64-bit pair store; bne-chain on b15
 *   risk:       the w1cc/w1d0 pair-store needs r4 to hold the getter ptr across func_020930b0 (mov r4,r0 then bl). If mwcc reloads after the call instead of binding r4, the two str diverge. reshape-able (bind temp p before call).
 *   confidence: med
 */
// func_0204ce90 — setter sequence then 3-way state switch (class C)
// arg r0 saved into r5 (callee-saved) for later use as func_0204cf7c arg.
// func_020498f0 reloaded per access; func_020930b0 returns a 64-bit pair
// (r0,r1) stored to +0x1cc/+0x1d0.

typedef struct GxState GxState;

extern GxState *func_020498f0(void);
extern void func_020498dc(int);
extern int  func_0204aaf4(void);
extern void func_0204cf7c(int, int, int);
extern int  func_0204d438(void);
extern void func_0204f0a8(int);
extern void func_02050054(int, int);
extern long long func_020930b0(void);

struct GxState {
    unsigned char pad00[0x15];
    unsigned char b15;        // +0x15
    unsigned char pad16[0x191];
    unsigned char b1a7;       // +0x1a7
    unsigned char pad1a8[0x24];
    int w1cc;                 // +0x1cc
    int w1d0;                 // +0x1d0
    unsigned char pad1d4[0x30];
    int w204;                 // +0x204
    int w208;                 // +0x208
};

int func_0204ce90(int arg) {
    int r5 = arg;

    func_020498f0()->w208 = 0;
    func_020498f0()->w204 = 0;
    func_020498f0()->b1a7 = 0;
    {
        GxState *p = func_020498f0();
        long long v = func_020930b0();
        p->w1cc = (int)v;
        p->w1d0 = (int)(v >> 32);
    }

    if (func_020498f0()->b15 == 0) {
        func_020498dc(3);
        func_0204f0a8(0);
        if (func_0204aaf4() != 0) return 0;
        return 1;
    }
    if (func_020498f0()->b15 == 1) {
        func_0204cf7c(0, 0, r5);
        if (func_0204d438() != 0) return 0;
        return 1;
    }
    if (func_020498f0()->b15 == 3) {
        func_02050054(6, (int)0xfffec5e6);
        return 0;
    }
    return 1;
}
