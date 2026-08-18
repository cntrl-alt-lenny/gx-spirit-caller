typedef struct {
    char _pad_18[0x18];
    int (*field_18)(void *, void *);
} Struct02191f40_A;

extern Struct02191f40_A data_02191f40;
extern char data_02191fa0[];
extern char data_02192020[];
extern void func_0201fccc(void);

extern int func_0201f138(int x);
extern int func_020a08f4(void *fn, int a, void *b);
extern int func_0201f19c(int arg);

int func_0201fc6c(void) {
    int callresult;
    int result;

    func_0201f138(3);
    callresult = data_02191f40.field_18(data_02191fa0, data_02192020);
    result = func_020a08f4((void *)func_0201fccc, callresult, data_02191fa0);
    if (result == 2) {
        return 1;
    }

    func_0201f19c(result);
    func_0201f138(9);
    return 0;
}
