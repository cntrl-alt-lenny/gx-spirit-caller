/* CAMPAIGN-PREP candidate for func_020453fc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r6 first; commutative arg-order; if-assign guard; two fn-ptr globals
 *   risk:       data_0219dacc/dac8 are fn-ptr globals dereffed once each; arg order to first fp is (a0,a3,a4) not (a0,a1,a2) -- if signature/order guessed wrong the mov shuffle diverges. permuter-class/struct-guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef void *(*Fp3a)(int heap, int size, int align);
typedef void (*Fp3b)(int heap, void *p, int size);

extern Fp3a data_0219dacc;
extern Fp3b data_0219dac8;
extern void func_02094688(const void *src, void *dst, unsigned int size);

void *func_020453fc(int heap, void *p, int size, int d, int align) {
    void *r;
    r = data_0219dacc(heap, d, align);
    if (r == 0) {
        return 0;
    }
    if (p != 0) {
        func_02094688(p, r, d);
        data_0219dac8(heap, p, size);
    }
    return r;
}
