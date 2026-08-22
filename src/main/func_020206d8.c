typedef struct {
    char _pad_00[0x6];
    unsigned short field_6;
    char _pad_08[0xc - 0x8];
    unsigned short field_c;
    char _pad_0e[0x30 - 0xe];
    int field_30;
    char _pad_34[0x38 - 0x34];
    void (*field_38)(void *, unsigned short);
} Struct02191f40_D;

extern Struct02191f40_D data_02191f40;
extern char data_020c67f8[];

extern void func_02093bfc(void);
extern int func_0201f138(int x);
extern unsigned short func_02020738(unsigned short a);

int func_020206d8(void) {
    if (data_02191f40.field_30 != 7) {
        func_02093bfc();
    }

    func_0201f138(1);
    data_02191f40.field_c = func_02020738(data_02191f40.field_6);

    if (data_02191f40.field_38) {
        data_02191f40.field_38(data_020c67f8, data_02191f40.field_c);
    }

    return data_02191f40.field_c;
}
