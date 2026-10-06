struct S0219dad0 {
    int field_0;            /* 0x0 */
    unsigned short field_4; /* 0x4 */
    unsigned short field_6; /* 0x6 */
    unsigned short field_8; /* 0x8 */
    unsigned short field_a; /* 0xa */
};

extern struct S0219dad0 *data_0219dad0;
extern void func_020945f4(void *dst, int val, int n);
extern void func_020458d8(int sel);
extern void func_02077b4c(void *p);

void func_02045954(struct S0219dad0 *state, int id, int unused, void *arg) {
    if (data_0219dad0 != 0) {
        return;
    }
    func_020945f4(state, 0, 0xc);
    state->field_8 = id;
    state->field_a = 1;
    state->field_4 = 1;
    state->field_6 = 0;
    data_0219dad0 = state;
    func_020458d8(0);
    func_02077b4c(arg);
}
