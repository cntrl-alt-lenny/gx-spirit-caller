extern void func_02098294(void *buf);
extern void func_02094500(void *buf, int a, int b);
extern void func_ov010_021b4044(void *buf, int a);
extern void func_02097f44(void *dst, void *src);
extern void func_02097db0(void *buf, void *ctx, int flag);
extern void func_0209281c(void *buf, int a);
extern void func_02038a84(void *dst, void *src, int n);
extern int func_02097efc(void *buf);

int func_ov010_021b4094(int cond, int r1val) {
    char buf24[0x48];
    char buf4[0x20];
    int buf0;
    void *ctx;

    if (cond == 0)
        ctx = (void *)((r1val << 4) + 4);
    else
        ctx = (void *)((r1val << 4) + 0xc);

    func_02098294(buf24);
    func_02094500(buf4, 0, 0x20);
    func_ov010_021b4044(buf4, 0);
    func_02097f44(buf24, buf4);
    func_02097db0(buf24, ctx, 0);
    func_0209281c(&buf0, 4);
    func_02038a84(buf24, &buf0, 4);
    func_02097efc(buf24);
    return buf0;
}
