typedef void *(*alloc_t)(int size, int align);
typedef void (*finish_t)(void *p);
typedef struct { char _pad[0xebc]; alloc_t fn; } ctx_02032e38_t;
typedef struct {
    char pad[0xeac];
    int count;
    int timeout;
    char pad2[8];
    alloc_t alloc;
    finish_t finish;
} context_t;
extern int data_020fe468;
extern void func_02032624(void *p);
extern void func_0203267c(void *p);
extern int func_0203269c(int a, int b, int c);
extern int func_020326bc(int a, int b);
extern int func_020326d4(ctx_02032e38_t *obj, int count);
/* This caller supplies a third argument, unused by the two-argument callee. */
extern int func_02033054(alloc_t alloc, finish_t finish, ...);
extern void func_020454f0(int a, int b);
extern void func_020945f4(void *dst, int val, unsigned int size);

int func_020330e4(context_t *ctx, int count, alloc_t alloc, finish_t finish) {
    int result;
    if (ctx == 0) {
        ctx = alloc(0xfa4, 4);
        if (ctx == 0) return -1;
        func_020945f4(ctx, 0, 0xfa4);
        ctx->alloc = alloc;
        if (count > 0x40) count = 0x40;
        ctx->finish = finish;
        ctx->timeout = 0x7530;
        ctx->count = count;
        if (func_020326d4((ctx_02032e38_t *)ctx, count) < 0) return -1;
        func_0203267c(ctx);
    }
    func_02032624((void *)2);
    result = data_020fe468;
    if (result < 0) result = func_02033054(alloc, finish, 0);
    func_020454f0((int)func_0203269c, (int)func_020326bc);
    return result;
}
