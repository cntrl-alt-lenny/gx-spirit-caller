extern void func_020766e0(void *dst, void *src, void *ctx);
extern void func_02094688(void *dst, void *src, int n);

extern char data_02101e48[];
extern char data_02101e4c[];
extern char data_02101e50[];

void func_0207667c(void *ctx) {
    char buf[0x30];

    func_020766e0(buf + 0x0, data_02101e48, ctx);
    func_020766e0(buf + 0x10, data_02101e4c, ctx);
    func_020766e0(buf + 0x20, data_02101e50, ctx);

    func_02094688(buf, ctx, 0x30);
}
