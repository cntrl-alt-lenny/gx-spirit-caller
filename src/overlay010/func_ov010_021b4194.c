extern void func_02098388(void *buf);
extern void func_020945f4(void *buf, int a, int b);
extern void func_ov010_021b4144(void *buf, int a);
extern void func_02098038(void *dst, void *src);
extern void func_02097ea4(void *buf, void *ctx, int flag);
extern void func_02092904(void *buf, int a);
extern void func_02038ad4(void *dst, void *src, int n);
extern int func_02097ff0(void *buf);

int func_ov010_021b4194(int cond, int r1val) {
    char buf24[0x48];
    char buf4[0x20];
    int buf0;
    void *ctx;

    if (cond == 0)
        ctx = (void *)((r1val << 4) + 4);
    else
        ctx = (void *)((r1val << 4) + 0xc);

    func_02098388(buf24);
    func_020945f4(buf4, 0, 0x20);
    func_ov010_021b4144(buf4, 0);
    func_02098038(buf24, buf4);
    func_02097ea4(buf24, ctx, 0);
    func_02092904(&buf0, 4);
    func_02038ad4(buf24, &buf0, 4);
    func_02097ff0(buf24);
    return buf0;
}
