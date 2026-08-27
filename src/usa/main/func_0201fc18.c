typedef struct {
    char _pad_18[0x18];
    int (*field_18)(void *, void *);
} Struct02191f40_A;

extern Struct02191f40_A data_02191e60;
extern char data_02191ec0[];
extern char data_02191f40[];
extern void func_0201fc78(void);

extern int func_0201f0e4(int x);
extern int func_020a0800(void *fn, int a, void *b);
extern int func_0201f148(int arg);

int func_0201fc18(void) {
    int callresult;
    int result;

    func_0201f0e4(3);
    callresult = data_02191e60.field_18(data_02191ec0, data_02191f40);
    result = func_020a0800((void *)func_0201fc78, callresult, data_02191ec0);
    if (result == 2) {
        return 1;
    }

    func_0201f148(result);
    func_0201f0e4(9);
    return 0;
}
