/* CAMPAIGN-PREP candidate for func_02077ecc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind ctx base across uses (r8); carry from unsigned-wrap compare; byte_off reset to 0 in if-branch
 *   risk:       Carry detection `lo < (nbits<<3)` and the byte_off=0/avail bookkeeping are scheduled across ldr/str of ctx+0x10/+0x14; mwcc likely reloads or reorders. permuter-class; offsets also struct-guessed.
 *   confidence: low
 */
/* func_02077ecc — bitstream sliding-window reader: advance a 64-bit
 * bit cursor by (nbits*8), then copy nbits bytes out of a 64-byte ring
 * buffer embedded at ctx+0x18, refilling via func_02077fd8 as it drains.
 * STRUCT OFFSETS GUESSED: +0x10 cursor_lo, +0x14 cursor_hi, +0x18 buf.
 */

extern void func_02077fd8(void *ctx, void *p);
extern void func_02094688(void *dst, void *src, int n);

typedef struct {
    unsigned char pad0[0x10];
    unsigned int cursor_lo;   /* +0x10 */
    unsigned int cursor_hi;   /* +0x14 */
    unsigned char buf[0x40];  /* +0x18 */
} BitCtx;

void func_02077ecc(BitCtx *ctx, unsigned char *dst, unsigned int nbits) {
    unsigned int old_lo = ctx->cursor_lo;
    unsigned int byte_off;
    unsigned int avail;
    unsigned int pos;

    ctx->cursor_lo = old_lo + (nbits << 3);
    if (ctx->cursor_lo < (nbits << 3)) ctx->cursor_hi++;
    byte_off = (old_lo >> 3) & 0x3f;
    avail = 0x40 - byte_off;
    ctx->cursor_hi += nbits >> 29;

    if (nbits >= avail) {
        func_02094688(dst, &ctx->buf[byte_off], avail);
        func_02077fd8(ctx, ctx->buf);
        byte_off = 0;
        pos = avail;
        while (pos + 0x3f < nbits) {
            func_02077fd8(ctx, dst + pos);
            pos += 0x40;
        }
    } else {
        pos = 0;
    }
    func_02094688(dst + pos, &ctx->buf[byte_off], nbits - pos);
}
