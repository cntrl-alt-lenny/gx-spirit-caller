struct S0219dad0 {
    unsigned char pad_00[0x4];
    unsigned short field_4; /* 0x4 */
    unsigned char pad_06[0x8 - 0x6];
    unsigned short field_8; /* 0x8 */
    unsigned short field_a; /* 0xa */
};

extern struct S0219dad0 *data_0219dad0;
extern int func_0203cb40(void);
extern void func_02091768(int count);

void func_02045618(void) {
    if (data_0219dad0 == 0) {
        return;
    }
    if (data_0219dad0->field_4 == 1) {
        data_0219dad0 = 0;
        return;
    }
    if (func_0203cb40() == 0) {
        do {
            func_02091768(10);
        } while (func_0203cb40() == 0);
    }
    data_0219dad0 = 0;
}
