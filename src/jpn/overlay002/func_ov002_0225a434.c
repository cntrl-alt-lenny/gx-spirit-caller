typedef struct {
    char pad1[0xd2c];
    int field_d2c;
    int field_d30;
} data_022d016c_t;
extern data_022d016c_t data_ov002_022d008c;

typedef struct {
    char pad[0x18];
    int field_18;
} data_022cd3f4_t;
extern data_022cd3f4_t data_ov002_022cd314;

extern void func_ov002_021d46ac(unsigned short x, unsigned short y, int one1, int one2);

void func_ov002_0225a434(int a, int b) {
    data_ov002_022d008c.field_d2c = 1;
    data_ov002_022d008c.field_d30 = 0;
    if (data_ov002_022cd314.field_18 == 0) {
        return;
    }
    {
        int flag = (a != 0) ? 0x8000 : 0;
        unsigned short x = (unsigned short)(flag | 0x1b);
        unsigned short y = (unsigned short)b;
        func_ov002_021d46ac(x, y, 1, 1);
    }
}
