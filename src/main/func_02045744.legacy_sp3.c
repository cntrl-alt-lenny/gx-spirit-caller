struct S0219dad0 {
    int field_0;            /* 0x0 */
    unsigned short field_4; /* 0x4 */
    unsigned short field_6; /* 0x6 */
    unsigned short field_8; /* 0x8 */
    unsigned short field_a; /* 0xa */
};

extern struct S0219dad0 *data_0219dad0;
extern int func_0203cc58(void);
extern int func_0207b5f8(void);

void func_02045744(void) {
    struct S0219dad0 *p = data_0219dad0;
    if (p == 0) {
        return;
    }
    if (p->field_4 == 2) {
        data_0219dad0->field_0 = func_0203cc58();
        return;
    }
    if (p->field_4 != 4) {
        return;
    }
    if (p->field_6 == 0) {
        return;
    }
    if (func_0207b5f8() == 9) {
        return;
    }
    data_0219dad0->field_6 = 0;
    data_0219dad0->field_4 = 6;
}
