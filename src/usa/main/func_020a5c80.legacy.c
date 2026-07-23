typedef struct {
    void *ptr;
    int field4;
    int field8;
} T_020a5d74;

extern T_020a5d74 data_021a9848;
extern int func_020b377c(int a, void *b);

void func_020a5c80(char *param) {
    void *adjusted = param - 2;
    data_021a9848.ptr = adjusted;
    data_021a9848.field4 = func_020b377c(0x1e, adjusted);
    data_021a9848.field8 = 0x1e;
}
