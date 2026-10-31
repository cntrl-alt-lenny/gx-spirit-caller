typedef struct {
    int pad;
    void (*fn)(int, void *, int);
    unsigned char flags;
} Context;
extern void *func_0203c900(int sel);

void func_0203c968(void) {
    Context *ctx = func_0203c900(1);
    if (ctx->flags & 0x10) {
        void *p = func_0203c900(0x10);
        ctx->flags &= ~0x10;
        ctx->fn(0x10, p, 0xd18);
    }
    if (ctx->flags & 8) {
        void *p = func_0203c900(8);
        ctx->flags &= ~8;
        ctx->fn(8, p, 0xc);
    }
    if (ctx->flags & 4) {
        void *p = func_0203c900(4);
        ctx->flags &= ~4;
        ctx->fn(4, p, 0x58);
    }
    if (ctx->flags & 2) {
        void *p = func_0203c900(2);
        ctx->flags &= ~2;
        ctx->fn(2, p, 0x2300);
    }
    if (ctx->flags & 1) {
        ctx->flags &= ~1;
        ctx->fn(1, ctx, 0x18);
    }
}
