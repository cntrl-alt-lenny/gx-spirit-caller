extern void func_0201f138(int mode);
extern void func_0201f19c(int arg);
extern int func_020a08f4(void *callback, int arg, void *ctx);
extern int func_0201f2bc(void);

typedef struct {
    char pad_0[0x24];
    int (*field_24)(void *, void *);
} D02191f40;

extern D02191f40 data_02191f40;
extern char data_02191fa0[];
extern char data_02191fe0[];

int func_0201f25c(void) {
    int r;
    int result;

    func_0201f138(3);
    r = data_02191f40.field_24(data_02191fa0, data_02191fe0);

    result = func_020a08f4((void *)func_0201f2bc, r, data_02191fa0);
    if (result == 2) {
        return 1;
    }

    func_0201f19c(result);
    func_0201f138(9);
    return 0;
}
