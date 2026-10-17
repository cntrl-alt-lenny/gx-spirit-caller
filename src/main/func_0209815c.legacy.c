extern void func_02098388(void *ctx);
extern int func_02098228(void *ctx, int name, int a2, void *buf);

int func_0209815c(int a2, int name) {
    char ctx[0x4c];
    func_02098388(ctx);
    if (func_02098228(ctx, name, a2, 0) != 0) {
        return 1;
    }
    return 0;
}
