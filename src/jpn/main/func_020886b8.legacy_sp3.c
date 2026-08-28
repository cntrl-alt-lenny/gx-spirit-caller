typedef struct {
    void *field_0;
    char pad_4[0xc - 4];
    void *field_c;
    void *field_10;
    int field_14;
    char pad_18[0x1c - 0x18];
    int field_1c;
    char pad_20[0x24 - 0x20];
    void *field_24;
    void *field_28;
    int field_2c;
} data_021a524c_t;

extern data_021a524c_t data_021a516c;
extern void Fill32(int value, void *dst, int size);
extern void func_0209281c(void *a0, int a1);
extern void func_02094fac(void *a0, void *a1, unsigned int a2, int a3);

void func_020886b8(void) {
    data_021a524c_t *p = &data_021a516c;
    unsigned int mask;

    if (p->field_0 == 0) {
        return;
    }

    p->field_1c = 0;
    Fill32(0, p->field_c, p->field_14);
    Fill32(0, p->field_10, p->field_14);
    func_0209281c(p->field_c, p->field_14);
    func_0209281c(p->field_10, p->field_14);

    mask = (p->field_2c >= 0) ? (1u << p->field_2c) : 0;
    func_02094fac(p->field_24, p->field_28, mask, 0);
}
