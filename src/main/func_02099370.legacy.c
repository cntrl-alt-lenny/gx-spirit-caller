typedef struct {
    unsigned int h[5];
    unsigned int count_lo;
    unsigned int count_hi;
    int used;
    unsigned char buf[64];
} Sha1Ctx;
extern void (*data_02102688)(Sha1Ctx *, const unsigned char *, unsigned int);
/* Fill32's assembly consumes value, destination and byte count. */
extern void Fill32(unsigned int value, void *dest, unsigned int size);

void func_02099370(Sha1Ctx *ctx, unsigned char *out) {
    int n;
    int i;
    unsigned int *words = (unsigned int *)ctx->buf;
    unsigned char *buf;
    unsigned int a;
    n = ctx->used;
    i = n >> 2;
    if ((n & 3) == 0) words[i] = 0;
    buf = ctx->buf;
    buf[n++] = 0x80;
    while ((n & 3) != 0) buf[n++] = 0;
    i++;
    if (ctx->used >= 56) {
        while (i < 16) { words[i] = 0; i++; }
        data_02102688(ctx, (unsigned char *)words, 64);
        i = 0;
    }
    while (i < 14) { words[i] = 0; i++; }
    a = ctx->count_lo;
    buf[63] = a;
    buf[62] = a >> 8;
    buf[61] = a >> 16;
    buf[60] = a >> 24;
    a = ctx->count_hi;
    buf[59] = a;
    buf[58] = a >> 8;
    buf[57] = a >> 16;
    buf[56] = a >> 24;
    data_02102688(ctx, (unsigned char *)words, 64);
    a = ctx->h[0];
    out[0] = a >> 24; out[1] = a >> 16; out[2] = a >> 8; out[3] = a;
    a = ctx->h[1];
    out[4] = a >> 24; out[5] = a >> 16; out[6] = a >> 8; out[7] = a;
    a = ctx->h[2];
    out[8] = a >> 24; out[9] = a >> 16; out[10] = a >> 8; out[11] = a;
    a = ctx->h[3];
    out[12] = a >> 24; out[13] = a >> 16; out[14] = a >> 8; out[15] = a;
    a = ctx->h[4];
    out[16] = a >> 24; out[17] = a >> 16; out[18] = a >> 8; out[19] = a;
    ctx->used = 0;
    Fill32(0, &ctx, 4);
}


