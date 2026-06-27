/* CAMPAIGN-PREP candidate for func_02053ab4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u16) lsl16/lsr16; byte-swap orr; strb b1 before strh h2
 *   risk:       reshape-able: (unsigned short)arg1 may emit `and #0xffff` instead of the orig lsl#16;lsr#16 — if so make the half a `:16` bitfield or short lvalue. Rec offsets (b1@1,h2@2,f4@4) struct-guessed.
 *   confidence: med
 */
/* func_02053ab4 (main, class D) — byte-swap arg1's low halfword into dst->h2,
 * tag dst->b1 = 2, then resolve dst->f4 via func_02054c0c with a -1 fallback
 * through func_0206ebe8's triple-deref.
 * BITFIELD/STORE-ORDER recipe: (u16) via lsl16;lsr16; emit strb b1 BEFORE strh h2.
 */

extern int  func_02054c0c(void *self);
extern void **func_0206ebe8(void *self);

typedef struct {
    char           _0;      /* 0x0 */
    unsigned char  b1;      /* 0x1 */
    unsigned short h2;      /* 0x2 */
    int            f4;      /* 0x4 */
} Rec;

int func_02053ab4(void *self, unsigned int arg1, Rec *dst) {
    unsigned int v = (unsigned short)arg1;      /* lsl#16 ; lsr#16 */

    dst->b1 = 2;
    dst->h2 = (unsigned short)(((v >> 8) & 0xff) | ((v << 8) & 0xff00));
    dst->f4 = func_02054c0c(self);

    if (dst->f4 == -1) {
        void **p = func_0206ebe8(self);
        if (p == 0)
            return 0;
        dst->f4 = *(int *)*(void **)p[3];
    }
    return 1;
}
