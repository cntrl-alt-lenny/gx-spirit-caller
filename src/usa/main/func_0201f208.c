extern void func_0201f0e4(int mode);
extern void func_0201f148(int arg);
extern int func_020a0800(void *callback, int arg, void *ctx);
extern int func_0201f268(void);

typedef struct {
    char pad_0[0x24];
    int (*field_24)(void *, void *);
} D02191f40;

extern D02191f40 data_02191e60;
extern char data_02191ec0[];
extern char data_02191f00[];

int func_0201f208(void) {
    int r;
    int result;

    func_0201f0e4(3);
    r = data_02191e60.field_24(data_02191ec0, data_02191f00);

    result = func_020a0800((void *)func_0201f268, r, data_02191ec0);
    if (result == 2) {
        return 1;
    }

    func_0201f148(result);
    func_0201f0e4(9);
    return 0;
}
