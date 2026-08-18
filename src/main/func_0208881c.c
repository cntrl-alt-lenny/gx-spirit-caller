typedef struct {
    void *field_0;
    char pad_4[0x24 - 4];
    void *field_24;
    void *field_28;
    int field_2c;
} data_021a524c_0208881c_t;

extern data_021a524c_0208881c_t data_021a524c;
extern void func_02095030(void *a0, void *a1, unsigned int a2, int a3);
extern int func_020955a8(void);
extern void func_02095678(int a0);
extern void func_020955e8(int a0);

void func_0208881c(void) {
    data_021a524c_0208881c_t *p = &data_021a524c;
    unsigned int mask;
    int result;

    if (p->field_0 == 0) {
        return;
    }

    mask = (p->field_2c >= 0) ? (1u << p->field_2c) : 0;
    func_02095030(p->field_24, p->field_28, mask, 0);
    result = func_020955a8();
    func_02095678(1);
    func_020955e8(result);
}
