typedef struct {
    char _pad_18[0x18];
    void *field_18;
    char _pad_1c[0x30 - 0x1c];
    int field_30;
    char _pad_34[0x38 - 0x34];
    void (*field_38)(void *);
} Struct02191f40_B;

extern Struct02191f40_B data_02191f40;
extern char data_020c66c8[];
extern char data_02192020[];
extern void func_0201fdc4(void);

extern int func_0201f138(int x);
extern int func_0209ea24(void *fn, void *a1, int a2, int a3, unsigned short a4);
extern int func_0201f19c(int arg);

int func_0201fd24(void) {
    int result;

    if (data_02191f40.field_30 != 4) {
        if (data_02191f40.field_30 != 6) {
            if (data_02191f40.field_30 != 5) {
                goto not_matched;
            }
        }
    }

    if (data_02191f40.field_38) {
        data_02191f40.field_38(data_020c66c8);
    }
    return 1;

not_matched:
    func_0201f138(3);
    result = func_0209ea24((void *)func_0201fdc4, data_02192020, 0, 1,
                           (unsigned short)(data_02191f40.field_18 != 0));
    if (result == 2) {
        return 1;
    }

    func_0201f19c(result);
    return 0;
}
