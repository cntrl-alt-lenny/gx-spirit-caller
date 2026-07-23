typedef struct {
    char pad[0x2c];
    void *base;
    int limit;
} Ctx_020967bc;

typedef struct {
    char pad0[8];
    Ctx_020967bc *ctx;
    char pad1[0x30 - 8 - 4];
    int field30;
    int index;
    int field38;
} Self_020967bc;

typedef struct {
    void *ctx;
    void *addr;
} ReadReq_020967bc;

extern int func_02096fb4(ReadReq_020967bc *req, int *out, int size);
extern int func_020964b8(Self_020967bc *self, int flag);

int func_020966c8(Self_020967bc *self) {
    Ctx_020967bc *ctx = self->ctx;
    unsigned int index = self->index;
    if (index * 8 >= (unsigned int)ctx->limit) {
        return 1;
    }
    {
        int out[2];
        ReadReq_020967bc req;
        int result;
        req.ctx = ctx;
        req.addr = (char *)ctx->base + index * 8;
        result = func_02096fb4(&req, out, 8);
        if (result != 0) {
            return result;
        }
        self->field30 = out[0];
        self->index = out[1];
        self->field38 = index;
    }
    return func_020964b8(self, 7);
}
