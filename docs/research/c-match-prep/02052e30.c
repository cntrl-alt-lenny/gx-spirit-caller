/* CAMPAIGN-PREP candidate for func_02052e30 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     memset(dst,0,12); guarded 12-byte struct copy via ldmia/stmia (3-int struct assign) in the eq branch; store-order self->f1c then call
 *   risk:       the cond `*(S*)dst = *(S*)(src+4)` must lower to ldmia/stmia of exactly 3 words (size 0xc). If the 3-int struct guesses wrong size/align, mwcc emits separate ldr/str. struct-guessed (S = 3x u32 at src+4)
 *   confidence: med
 */
/* func_02052e30: zero dst, then either struct-copy or two setters.
 * r0=src(self), r1=dst.
 */

typedef struct { unsigned int a, b, c; } Tri;

typedef struct {
    char _pad0[0x4];
    Tri  body;          /* +0x4 .. +0xf */
    char _pad1[0xc];
    int  f1c;           /* +0x1c */
} Src;

extern void *func_020945f4(void *dst, int val, int len);   /* memset */
extern int   func_02053190(void *self);
extern void  func_020536b4(void *dst, int value);
extern void  func_02053600(void *dst, int flag);

void func_02052e30(Src *src, void *dst) {
    func_020945f4(dst, 0, 0xc);
    if (func_02053190(src) == 0) {
        *(Tri *)dst = src->body;
        return;
    }
    func_020536b4(dst, src->f1c);
    func_02053600(dst, 3);
}
