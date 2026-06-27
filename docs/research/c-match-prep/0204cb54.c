/* CAMPAIGN-PREP candidate for func_0204cb54 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload-each-use getter; r4=1 init returned; if-not-3 early block
 *   risk:       r5 is allocated (mov r5,r0) only to stage the b0d->b14 copy; if mwcc fuses the two getter calls or skips the temp, that store pair diverges. reshape-able (split temp).
 *   confidence: med
 */
// func_0204cb54 — state-branch + setter sequence (class C, reload-each-use)
// func_020498f0 returns a pointer to the global state struct; it is RELOADED
// before every field access in the asm (no caching in a callee-saved reg).

typedef struct GxState GxState;

extern GxState *func_020498f0(void);
extern void func_020498dc(int);
extern void func_0204bd8c(void);
extern void func_0204bf00(void);
extern int  func_0204ce90(int);
extern void func_02050054(int, int);
extern void func_02065788(void *);

struct GxState {
    unsigned char pad00[0xd];
    unsigned char b0d;       // +0x0d
    unsigned char pad0e[0x6];
    unsigned char b14;       // +0x14
    unsigned char b15;       // +0x15
    unsigned char pad16[0x186];
    void *p19c;              // +0x19c
    unsigned char pad1a0[0x68];
    int w208;                // +0x208
};

int func_0204cb54(void) {
    int r4 = 1;

    if (func_020498f0()->b15 != 3) {
        if (func_020498f0()->b0d != 0) {
            func_0204bd8c();
        }
        func_02050054(6, (int)0xfffec5d2);
        return 0;
    }

    {
        GxState *p = func_020498f0();
        p->b14 = func_020498f0()->b0d;
    }
    func_020498f0()->w208 = 0;

    if (func_020498f0()->p19c != 0) {
        func_02065788(func_020498f0()->p19c);
        func_020498f0()->p19c = 0;
    }

    if (func_020498f0()->b0d != 0) {
        func_0204bf00();
    } else {
        func_020498dc(4);
        r4 = func_0204ce90(0);
    }
    return r4;
}
