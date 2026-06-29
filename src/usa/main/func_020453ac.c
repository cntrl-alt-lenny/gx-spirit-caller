/* CAMPAIGN-PREP candidate for func_020453ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r6 first; commutative arg-order; if-assign guard; two fn-ptr globals
 *   risk:       data_0219d9ec/dac8 are fn-ptr globals dereffed once each; arg order to first fp is (a0,a3,a4) not (a0,a1,a2) -- if signature/order guessed wrong the mov shuffle diverges. permuter-class/struct-guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef u32 (*Fp3a)(u32 a, u32 b, u32 c);
typedef void (*Fp3b)(u32 a, u32 b, u32 c);

extern Fp3a data_0219d9ec;
extern Fp3b data_0219d9e8;
extern void func_02094688(u32 a, u32 b, u32 c);

u32 func_020453ac(u32 a0, u32 a1, u32 a2, u32 a3, u32 a4) {
    u32 r;
    r = data_0219d9ec(a0, a3, a4);
    if (r == 0) {
        return 0;
    }
    if (a1 != 0) {
        func_02094688(a1, r, a3);
        data_0219d9e8(a0, a1, a2);
    }
    return r;
}
