typedef struct {
    int w;
    unsigned short idx;
    unsigned short cnt;
    int f8;
} Rec;

typedef struct {
    char pad[0x34];
    char *base;
} Ctx;

typedef struct {
    char pad0[8];
    Ctx *ctx;
    char pad1[0x14];
    Rec dst;
    int f2c;
    Rec src;
} Self;

typedef struct {
    Ctx *ctx;
    char *addr;
} Req;

typedef struct {
    int off;
    unsigned short a;
    unsigned short b;
} Out;

extern int func_020970a8(Req *req, Out *out, int size);

int func_02096f64(Self *self) {
    Ctx *ctx = self->ctx;
    Rec *src = &self->src;
    Out out;
    Req req;
    int result;
    req.ctx = ctx;
    req.addr = ctx->base + src->idx * 8;
    result = func_020970a8(&req, &out, 8);
    if (result == 0) {
        self->dst = *src;
        if (src->cnt == 0 && src->f8 == 0) {
            self->dst.cnt = out.a;
            self->dst.f8 = (int)(ctx->base + out.off);
        }
        self->f2c = out.b & 0xfff;
    }
    return result;
}
