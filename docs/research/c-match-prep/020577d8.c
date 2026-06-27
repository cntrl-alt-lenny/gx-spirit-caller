/* CAMPAIGN-PREP candidate for func_020577d8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: used-=off, guarded shift, data[used]=0, off=0; bind buf->r4
 *   risk:       func_020a7388 sets only r0,r1 so guessed 2-arg; if memmove(dst,src,n) the missing length arg diverges. struct-guessed.
 *   confidence: med
 */
/* func_020577d8 (D): compact byte buffer (consume off bytes). */
extern void func_020a7388(unsigned char *dst, unsigned char *src);
typedef struct Buf { unsigned char *data; int _4; int used; int off; } Buf;
int func_020577d8(int unused, Buf *buf) {
    if (buf == 0) return 0;
    if (buf->data == 0) return 0;
    if (buf->off == 0) return 0;
    buf->used -= buf->off;
    if (buf->used != 0)
        func_020a7388(buf->data, buf->data + buf->off);
    buf->data[buf->used] = 0;
    buf->off = 0;
    return 0;
}
