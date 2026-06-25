/* CAMPAIGN-PREP candidate for func_02051384 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shuffle r0-r2 into f310(2,...); a3->+46c, stacked a4->+470; reload getter
 *   risk:       struct fields at 0xf4/0x2f0/0x470 are guessed; the +0xf4=+0x200 copy needs r4 bound across two getter calls (mov r4,r0; bl; ldr [r0+0x200]; str [r4+0xf4]) — if mwcc reloads, that store diverges. struct-guessed + reshape-able.
 *   confidence: low
 */
// func_02051384 — arg shuffle into a call then setter sequence (class C)
// Shifts (r0..r3) -> func_0204f310(2, r0, r1, r2) with r3 kept in r4 for a
// later store. A 5th incoming stack arg ([sp+8]) is stored to +0x470.
// func_020498f0 reloaded per access; r4 reused to hold the getter ptr.

typedef struct GxState GxState;

extern unsigned char data_0219dc8c[];
extern GxState *func_020498f0(void);
extern void func_020498dc(int);
extern int  func_0204ab88(void);
extern void func_0204f310(int, int, int, int);
extern void func_0204f820(void);
extern void func_02051618(int);

struct GxState {
    unsigned char pad00[0xe];
    unsigned char b0e;        // +0x0e
    unsigned char pad0f[0x1];
    int w10;                  // +0x10
    unsigned char pad14[0x1ec];
    int w200;                 // +0x200
    unsigned char pad204[0x268];
    int w46c;                 // +0x46c
    int w470;                 // +0x470
    unsigned char pad474[0x278];
    int w2f0_pad;             /* placeholder to reach 0x2f0 */
};

void func_02051384(int a0, int a1, int a2, int a3, int a4) {
    func_0204f310(2, a0, a1, a2);

    func_020498f0()->w46c = a3;
    func_020498f0()->w470 = a4;
    {
        GxState *p = func_020498f0();          // r4
        p->_f4 = func_020498f0()->w200;        // +0xf4 = +0x200
    }
    func_020498f0()->_2f0 = 1;                 // +0x2f0
    func_020498f0()->b0e = 0;
    data_0219dc8c[1] = 0;

    func_020498dc(10);
    func_0204f820();
    if (func_0204ab88() != 0) return;
    if (func_020498f0()->w10 != 0) return;
    func_02051618(func_020498f0()->w200);
}
