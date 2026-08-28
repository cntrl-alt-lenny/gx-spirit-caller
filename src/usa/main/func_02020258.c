typedef struct {
    char _pad_00[0x38];
    void (*field_38)(void *, int);
    int field_3c;
} Struct02191f40_C;

extern Struct02191f40_C data_02191e60;
extern char data_02193240[];
extern char data_020c66d8[];
extern void func_02020304(void);

extern int func_0209281c(void *a, int b);
extern int func_0209f1b4(void *fn, int a1, int a2, int a3, int a4, int a5, int a6);
extern int func_0201f0a0(int a0);

int func_02020258(int arg0, int arg1, int arg2) {
    int result;

    func_0209281c(data_02193240, data_02191e60.field_3c);

    result = func_0209f1b4((void *)func_02020304, arg2, arg0, arg1, 0xffff, 0xe, 2);
    if (result == 2) {
        goto matched;
    }

    if (data_02191e60.field_38) {
        int v = func_0201f0a0(result);
        data_02191e60.field_38(data_020c66d8, v);
    }

    return 0;

matched:
    return 1;
}
