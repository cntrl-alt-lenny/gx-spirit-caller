typedef struct {
    unsigned int h[5];
    unsigned int count_lo;
    unsigned int count_hi;
    unsigned int pad;
} Sha1Ctx;

void func_020996c8(Sha1Ctx *ctx) {
    ctx->h[0] = 0x67452301;
    ctx->h[1] = 0xefcdab89;
    ctx->h[2] = 0x98badcfe;
    ctx->h[3] = 0x10325476;
    ctx->h[4] = 0xc3d2e1f0;
    ctx->count_lo = 0;
    ctx->count_hi = 0;
    ctx->pad = 0;
}
