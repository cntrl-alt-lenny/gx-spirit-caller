/* CAMPAIGN-PREP candidate for func_021c9da0 (ov012, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 count; 0x1000-cnt; 3-int struct copies; post-decrement; return 1
 *   risk:       the call is a .word (0xebffa68c -> 0x021b37f8) unresolved under ov0/ov2 overlap; mwcc cannot target it by symbol, and the stmia/ldmia arg-marshalling is opaque -> likely escape-to-.s. permuter-class
 *   confidence: low
 */
/* func_ov012_021c9da0: take a u16 count at +0, compute (0x1000 - count), call a
 * worker, then a triple-word struct copy shuffle, then count--.
 * NOTE: the worker is hand-encoded .word 0xebffa68c -> 0x021b37f8 (NOT the
 * .extern func_ov000_021aaa20 at 0x021aaa20); under the ov0/ov2 base overlap the
 * BL resolves to a different overlay with no clean symbol, so this may need to
 * ship as .s. The ldmia/stmia trios are a 12-byte struct copy (3 ints).
 *  cnt = obj->h0; arg2 = 0x1000 - cnt;
 *  worker(&s8, data_ov012_021cc6a0[0x524], arg2 ...);
 *  copy s8 -> s20; zero s14(3 ints); copy s20 -> (sp-4); ... call;
 *  obj->h0 = cnt - 1; return 1. */
extern char data_ov012_021cc6a0[];
extern int  func_ov000_021aaa20();   /* resolves to 0x021b37f8 under overlap */

typedef struct { int a, b, c; } Tri;

int func_ov012_021c9da0(void *obj) {
    unsigned short *cntp = (unsigned short *)obj;
    int arg2 = 0x1000 - *cntp;
    Tri s8;
    Tri s20;
    Tri zero;

    func_ov000_021aaa20(&s8, *(int *)(data_ov012_021cc6a0 + 0x524), arg2);
    s20 = s8;
    zero.a = 0; zero.b = 0; zero.c = 0;
    func_ov000_021aaa20(s20.a, zero.a, zero.b, zero.c);  /* placeholder marshalling */
    *cntp = (unsigned short)(*cntp - 1);
    return 1;
}
