typedef struct {
    void *ptr;
    int field4;
    int field8;
} T_020a5d74;

extern T_020a5d74 data_021a9928;
extern int func_020b3870(int a, void *b);

void func_020a5d74(char *param) {
    void *adjusted = param - 2;
    data_021a9928.ptr = adjusted;
    data_021a9928.field4 = func_020b3870(0x1e, adjusted);
    data_021a9928.field8 = 0x1e;
}
