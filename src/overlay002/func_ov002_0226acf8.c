typedef struct {
    char pad[0xd94];
    int field0xd94;
    int field0xd98;
} DataD016c_acf8;

typedef struct {
    char pad[0xa0];
    unsigned short field0xa0;
    unsigned short field0xa2;
} DataD0e6c_acf8;

extern DataD016c_acf8 data_ov002_022d016c;
extern DataD0e6c_acf8 data_ov002_022d0e6c;
extern void func_ov002_0226ac94(void);

void func_ov002_0226acf8(int arg0, int arg1, short arg2, short arg3) {
    data_ov002_022d016c.field0xd94 = arg0;
    data_ov002_022d016c.field0xd98 = arg1;
    data_ov002_022d0e6c.field0xa0 = arg2;
    data_ov002_022d0e6c.field0xa2 = arg3;
    func_ov002_0226ac94();
}
