typedef struct {
    unsigned char pad[0x63c];
    unsigned int flags;
} Ctx_020469d0;

extern Ctx_020469d0 *data_0219da0c;
extern int func_020466ac(int);

int func_02046964(int a0) {
    Ctx_020469d0 *ctx = data_0219da0c;

    if (ctx == 0) {
        return 0;
    }
    if ((ctx->flags & (1 << a0)) == 0) {
        return 0;
    }
    return func_020466ac(a0);
}
