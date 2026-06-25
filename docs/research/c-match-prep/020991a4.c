/* CAMPAIGN-PREP candidate for func_020991a4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u64 counter -> adds/adc#0; idx&0x3f bitmask; len>>6 block loop; input-first memcpy operands
 *   risk:       permuter-class: heavy callee-saved reg layout (r4..r9). Also func_02094688 arg-DIRECTION is guessed (asm dst=r0=input, src=r1=buffer — opposite of memcpy(dst,src)); if real sig differs the block/tail copies swap r0/r1.
 *   confidence: low
 */
/* func_020991a4 (main, class C) — MD5_Update.
 * ctx@r0: count64 at +0x10/+0x14 (lo,hi), 64-byte buffer at +0x18.
 *   idx   = count.lo & 0x3f;  count += len (u64, adc #0);  fill = 0x40 - idx;
 *   if (fill > len): partial -> memcpy(buf+idx, input, len); return;
 *   else: memcpy(buf+idx, input, fill); transform(ctx);
 *         len -= fill; input += fill; n = len>>6;
 *         while (n-- > 0) { memcpy(input, buf, 0x40); transform(ctx); input+=0x40; }
 *         rem = len & 0x3f; if (rem) memcpy(input, buf, rem);
 * NOTE the per-block / tail memcpy land input in r0, buffer in r1 (asm dst=r0=
 * input). Operands written input-first to reproduce that register choice. */

typedef struct {
    char _pad0[0x10];
    unsigned int count_lo;   /* +0x10 */
    unsigned int count_hi;   /* +0x14 */
    unsigned char buffer[0x40]; /* +0x18 */
} MD5Ctx;

extern void func_02094688(void *dst, const void *src, int n);
extern void func_02098cf8(MD5Ctx *ctx);

void func_020991a4(MD5Ctx *ctx, const unsigned char *input, int len) {
    unsigned int idx;
    unsigned int fill;
    int n;
    idx = ctx->count_lo & 0x3f;
    {
        unsigned long long c = ((unsigned long long)ctx->count_hi << 32) | ctx->count_lo;
        c += (unsigned int)len;
        ctx->count_lo = (unsigned int)c;
        ctx->count_hi = (unsigned int)(c >> 32);
    }
    fill = 0x40 - idx;
    if (fill > (unsigned int)len) {
        if (len == 0) return;
        func_02094688(ctx->buffer + idx, input, len);
        return;
    }
    func_02094688(ctx->buffer + idx, input, fill);
    func_02098cf8(ctx);
    len -= fill;
    input += fill;
    n = (int)((unsigned int)len >> 6);
    while (n > 0) {
        func_02094688((void *)input, ctx->buffer, 0x40);
        func_02098cf8(ctx);
        input += 0x40;
        n--;
    }
    if ((len & 0x3f) != 0)
        func_02094688((void *)input, ctx->buffer, len & 0x3f);
}
