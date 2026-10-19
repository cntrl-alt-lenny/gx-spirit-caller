typedef struct {
    unsigned int h[5];
    unsigned int count_lo;
    unsigned int count_hi;
    unsigned int used;
    unsigned char buf[64];
} Sha1Ctx;
extern void func_02094688(const void *src, void *dst, unsigned int size);
extern void (*data_02102688)(Sha1Ctx *, const unsigned char *, unsigned int);

void func_0209956c(Sha1Ctx *ctx, const unsigned char *data, unsigned int len) {
    unsigned int lo;
    int blocks;
    unsigned char *buf = ctx->buf;
    if (len == 0) return;
    lo = ctx->count_lo + (len << 3);
    if (lo < ctx->count_lo) ctx->count_hi++;
    ctx->count_hi += len >> 29;
    ctx->count_lo = lo;
    if (ctx->used != 0) {
        if (ctx->used + len >= 64) {
            blocks = 64 - ctx->used;
            func_02094688(data, buf + ctx->used, blocks);
            len -= blocks;
            data += blocks;
            data_02102688(ctx, buf, 64);
            ctx->used = 0;
        } else {
            func_02094688(data, buf + ctx->used, len);
            ctx->used += len;
            return;
        }
    }
    if (len >= 64) {
        blocks = len & ~63;
        len -= blocks;
        if (((unsigned int)data & 3) == 0) {
            data_02102688(ctx, data, blocks);
            data += blocks;
        } else {
            do {
                func_02094688(data, buf, 64);
                data += 64;
                data_02102688(ctx, buf, 64);
                blocks -= 64;
            } while (blocks > 0);
        }
    }
    ctx->used = len;
    if (len != 0) func_02094688(data, buf, len);
}
