extern void func_02094688(const void *src, void *dst, unsigned int size);
extern void func_020928e8(void *addr, int len);

typedef struct {
    unsigned char pad0[0x3c];
    unsigned short active;
    unsigned char pad3e[6];
    unsigned int state;
    unsigned char pad48[8];
    unsigned char data[8];
} Context;

int func_020a6924(Context *ctx) {
    unsigned short data[4];
    if (ctx == 0) return 0;
    if (ctx->active == 0) return 0;
    func_02094688(ctx->data, data, 8);
    func_020928e8(data, 8);
    if (ctx->state == 0) {
        if (((volatile unsigned short *)data)[0] == 0x2348 || ((volatile unsigned short *)data)[0] == 0xbd8a) {
            if (data[3] == 4) return 1;
        }
    }
    return 0;
}

