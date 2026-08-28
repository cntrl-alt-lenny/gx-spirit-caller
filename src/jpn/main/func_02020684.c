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

extern Struct02191f40_D data_02191e60;
extern char data_020c6718[];

extern void func_02093b08(void);
extern int func_0201f0e4(int x);
extern unsigned short func_020206e4(unsigned short a);

int func_02020684(void) {
    if (data_02191e60.field_30 != 7) {
        func_02093b08();
    }

    func_0201f0e4(1);
    data_02191e60.field_c = func_020206e4(data_02191e60.field_6);

    if (data_02191e60.field_38) {
        data_02191e60.field_38(data_020c6718, data_02191e60.field_c);
    }

    return data_02191e60.field_c;
}
