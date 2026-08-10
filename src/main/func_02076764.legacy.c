extern void func_020767c8(void *dst, void *src, void *ctx);
extern void func_02094688(void *dst, void *src, int n);

extern char data_02101f28[];
extern char data_02101f2c[];
extern char data_02101f30[];

void func_02076764(void *ctx) {
    char buf[0x30];

    func_020767c8(buf + 0x0, data_02101f28, ctx);
    func_020767c8(buf + 0x10, data_02101f2c, ctx);
    func_020767c8(buf + 0x20, data_02101f30, ctx);

    func_02094688(buf, ctx, 0x30);
}
