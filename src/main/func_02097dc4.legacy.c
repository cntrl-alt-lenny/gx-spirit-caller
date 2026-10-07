typedef struct {
    void *f_0;
    unsigned short f_4;
    unsigned short f_6;
    int f_8;
} list_ctl_t;

extern list_ctl_t data_021a830c;
extern void func_02098388(void *ctx);
extern int func_02098228(void *ctx, int name, int a2, void *buf);

int func_02097dc4(int name) {
    list_ctl_t out;
    char ctx[0x4c];
    func_02098388(ctx);
    if (func_02098228(ctx, name, 0, &out) == 0) {
        return 0;
    }
    data_021a830c = out;
    return 1;
}
