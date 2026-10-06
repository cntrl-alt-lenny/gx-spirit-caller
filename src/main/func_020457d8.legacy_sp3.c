struct S0219dad0 {
    int field_0;            /* 0x0 */
    unsigned short field_4; /* 0x4 */
    unsigned short field_6; /* 0x6 */
    unsigned short field_8; /* 0x8 */
    unsigned short field_a; /* 0xa */
};

extern struct S0219dad0 *data_0219dad0;
extern int func_02045678(void);

int func_020457d8(void) {
    if (data_0219dad0 == 0) {
        return 0;
    }
    if (data_0219dad0->field_0 == 0) {
        return 0;
    }
    data_0219dad0->field_4 = 3;
    func_02045678();
    return 1;
}
