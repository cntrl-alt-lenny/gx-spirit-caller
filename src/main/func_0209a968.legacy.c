typedef struct {
    char pad_0[4];
    int field_4;
    int field_8;
    int field_c;
} data_021a83e4_t;

extern data_021a83e4_t data_021a83e4;
extern int func_0209b4e4(void);
extern void func_0209adb4(void *p);

int func_0209a968(int a0, int a1, int a2) {
    if (func_0209b4e4() == 0) {
        return 1;
    }
    data_021a83e4.field_4 = a1;
    data_021a83e4.field_8 = a2;
    data_021a83e4.field_c = a0;
    func_0209adb4((void *)0x03006700);
    return 0;
}
