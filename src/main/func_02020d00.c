typedef struct {
    char pad0[0x30];
    int w30;
    char pad34[0x6c];
    void *pa0;
    unsigned short ha4;
    char pad_a6[2];
    int wa8;
    unsigned short hac;
} State;

extern State data_02191f40;
extern char data_02193340[];
extern void func_02020ce0(void);
extern void func_020944a4(void *src, void *dst, int n);
extern int func_020a078c(void *fn, void *buf, int size, int a, unsigned short b, unsigned char c);

void func_02020d00(void *src, int flag) {
    func_020944a4(src, data_02193340, 0x30);
    data_02191f40.pa0 = data_02193340;
    data_02191f40.ha4 = 0x30;
    if (data_02191f40.w30 != 4) {
        return;
    }
    func_020a078c(func_02020ce0, data_02193340, 0x30, data_02191f40.wa8, data_02191f40.hac, flag != 0);
}
