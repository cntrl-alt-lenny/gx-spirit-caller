struct S0219dad0 {
    int field_0;            /* 0x0 */
    unsigned short field_4; /* 0x4 */
    unsigned short field_6; /* 0x6 */
    unsigned short field_8; /* 0x8 */
    unsigned short field_a; /* 0xa */
};

extern struct S0219dad0 *data_0219dad0;
extern int func_0203cbc0(void);
extern void func_0204525c(int a0, int a1);

int func_02045678(void) {
    int result;
    if (data_0219dad0 == 0) {
        return 0;
    }
    if (data_0219dad0->field_4 == 1) {
        return data_0219dad0->field_4;
    }
    result = func_0203cbc0();
    if (result == 5) {
        data_0219dad0->field_4 = 4;
        data_0219dad0->field_6 = 1;
        return 4;
    }
    if (result < 0) {
        if (result >= -10) {
            func_0204525c(9, result - 700);
            data_0219dad0->field_4 = 8;
            return 8;
        }
        func_0204525c(5, result);
        data_0219dad0->field_4 = 7;
        return 7;
    }
    return 2;
}
