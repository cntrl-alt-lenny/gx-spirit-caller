/* CAMPAIGN-PREP candidate for func_02003e98 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed fork + a5/2, 8-arg marshal with global f_8 stacked first
 *   risk:       permuter-class: already .s-shipped. Like a4c but 8 args/4 stack slots and a global load (data_02102c7c.f_8) interleaved into the marshal. Stack-store order + reg vs stack split is scheduling-sensitive; reshape unlikely to byte-match.
 *   confidence: low
 */
/* func_02003e98: same shape as func_02003a4c with one extra global arg.
 *   if (a1 < 0x80) func_02003d98(a0,a1,a2,a3,a4,a5);
 *   else { t=func_020038c0(a1,a5);
 *          func_020028b8(t, a3, a4, a5,
 *                        data_02102c7c.f_8, *(int*)a0, a2, a5/2); }
 * NOTE: already ships as src/main/func_02003e98.s (brief 302). Best-effort.
 * Class D divmod: signed a5/2 from add/lsr#31/asr#1. Extra stacked arg
 * data_02102c7c.f_8 (ldr =data_02102c7c; ldr [r1,#8]) is marshalled first.
 * 8-arg call -> 4 stack slots (sub sp,#0x10). a4=[sp+0x28], a5=[sp+0x2c]. */

typedef struct {
    char         _pad0[0x8];
    int          f_8;       /* +0x8 */
} state_02102c7c_t;

extern state_02102c7c_t data_02102c7c;
extern void func_02003d98(void *a0, int a1, int a2, int a3, int a4, int a5);
extern int  func_020038c0(int a1, int a5);
extern void func_020028b8(int p0, int a3, int a4, int a5,
                          int gf8, int s0, int a2, int half);

void func_02003e98(void *a0, int a1, int a2, int a3, int a4, int a5) {
    if (a1 < 0x80) {
        func_02003d98(a0, a1, a2, a3, a4, a5);
    } else {
        int t = func_020038c0(a1, a5);
        func_020028b8(t, a3, a4, a5, data_02102c7c.f_8,
                      *(int *)a0, a2, a5 / 2);
    }
}
