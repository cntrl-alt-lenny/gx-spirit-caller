typedef struct {
    unsigned char pad[0x644];
    unsigned int flags;
} Ctx_020469d0;

extern Ctx_020469d0 *data_0219daec;
extern int func_02046718(int);

int func_020469d0(int a0) {
    Ctx_020469d0 *ctx = data_0219daec;

    if (ctx == 0) {
        return 0;
    }
    if ((ctx->flags & (1 << a0)) == 0) {
        return 0;
    }
    return func_02046718(a0);
}
