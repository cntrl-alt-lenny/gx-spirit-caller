typedef struct {
    int state[4];
    unsigned long long count;
    unsigned char buf[64];
} Ctx;

extern void func_02094688(const void *src, void *dst, unsigned int size);
extern void func_02098cf8(Ctx *ctx);

void func_020991a4(Ctx *ctx, const unsigned char *data, unsigned int len) {
    unsigned int off;
    unsigned int space;
    unsigned int blocks;
    const unsigned char *p;
    off = (unsigned int)ctx->count & 0x3f;
    space = 0x40 - off;
    ctx->count += len;
    if (space > len) {
        if (len == 0) {
            return;
        }
        func_02094688(data, ctx->buf + off, len);
        return;
    }
    func_02094688(data, ctx->buf + off, space);
    func_02098cf8(ctx);
    len -= space;
    blocks = len >> 6;
    p = data + space;
    while ((int)blocks > 0) {
        func_02094688(p, ctx->buf, 0x40);
        p += 0x40;
        func_02098cf8(ctx);
        blocks--;
    }
    if ((len & 0x3f) == 0) {
        return;
    }
    func_02094688(p, ctx->buf, len & 0x3f);
}
