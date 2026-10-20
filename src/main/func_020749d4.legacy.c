typedef unsigned char u8;
typedef unsigned int u32;
typedef struct {
    u8 pad0[0x455];
    u8 state;
    u8 retained;
    u8 pad1[0x3cd];
    u8 *buffer;
    u32 total;
    u32 used;
} Context;
struct S0980 {
    u8 pad0[8];
    u8 f_8;
    u8 pad1[3];
    Context *ctx;
    u8 pad2[0x2c];
    int f_3c;
    int f_40;
    int f_44;
};
extern void func_02070980(int arg0, struct S0980 *s);
extern int func_02070ac0(int *out, void *arg1);
extern void func_02075ae8(Context *ctx, u8 *buf);
extern void func_02094688(const void *src, void *dst, int n);
extern void *(*data_0219eee0)(int);

void func_020749d4(struct S0980 *s) {
    Context *ctx = s->ctx;
    int count;
    u8 *p;
    int complete;
    if (ctx->buffer == 0) {
        if ((u32)s->f_44 < 5) return;
        p = (u8 *)func_02070ac0(&count, s);
        count = (p[3] << 8) + p[4] + 5;
        if ((u32)count > 0x4805) {
            ctx->state = 9;
            return;
        }
        ctx->buffer = data_0219eee0(count);
        if (ctx->buffer == 0) {
            ctx->state = 9;
            return;
        }
        ctx->total = count;
        ctx->used = 0;
        ctx->retained = 0;
    } else {
        if (s->f_44 == 0) return;
    }
    p = (u8 *)func_02070ac0(&count, s);
    if ((u32)count >= ctx->total - ctx->used) {
        count = ctx->total - ctx->used;
        complete = 1;
    } else {
        complete = 0;
    }
    func_02094688(p, ctx->buffer + ctx->used, count);
    func_02070980(count, s);
    if (complete) {
        func_02075ae8(ctx, ctx->buffer);
        if (ctx->retained == 0) ctx->buffer = 0;
    } else {
        ctx->used = ctx->used + count;
    }
}

