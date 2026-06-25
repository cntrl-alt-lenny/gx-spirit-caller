/* CAMPAIGN-PREP candidate for func_02081598 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cache a0..a3 in r7..r4 (param order); if(flags&0x100)/else if(&0x80); divmod /2 via plain (x+1)/2 signed magic; minuend (arg4+1)/2 first; forward 7-arg tail
 *   risk:       reshape-able: flag tests may emit ands (dead-reg write) vs tst — wrong pick diverges 1 insn; (x+1)/2 magic (add x,x lsr#31; asr#1) reliable. a0 offsets f4/fc struct-guessed.
 *   confidence: med
 */
/* func_02081598: flag-gated offset adjust (one with signed /2), forward call. */
typedef struct {
    char _pad00[0x4];  /* 0x0 */
    void *f4;          /* 0x4  obj for func_0207ff84 */
    char _pad08[0x4];  /* 0x8 */
    int  fc;           /* 0xc */
} a0_t;

extern int func_0207ff84(void *obj, int arg1, int arg2);
extern int func_020816f4(a0_t *a0, int a1, int a2, int a3, int arg5, int flags, int arg7);

int func_02081598(a0_t *a0, int a1, int a2, int a3,
                  int arg4, int arg5, int flags, int arg7) {
    if (flags & 0x100) {
        int res = func_0207ff84(a0->f4, a0->fc, arg7);
        a2 += arg4 - res;
    } else if (flags & 0x80) {
        int res = func_0207ff84(a0->f4, a0->fc, arg7);
        a2 += (arg4 + 1) / 2 - (res + 1) / 2;
    }
    return func_020816f4(a0, a1, a2, a3, arg5, flags, arg7);
}
