typedef struct {
    void *field_0;
    char pad_4[0x24 - 4];
    void *field_24;
    void *field_28;
    int field_2c;
} data_021a524c_0208881c_t;

extern data_021a524c_0208881c_t data_021a516c;
extern void func_02094f3c(void *a0, void *a1, unsigned int a2, int a3);
extern int func_020954b4(void);
extern void func_02095584(int a0);
extern void func_020954f4(int a0);

void func_02088734(void) {
    data_021a524c_0208881c_t *p = &data_021a516c;
    unsigned int mask;
    int result;

    if (p->field_0 == 0) {
        return;
    }

    mask = (p->field_2c >= 0) ? (1u << p->field_2c) : 0;
    func_02094f3c(p->field_24, p->field_28, mask, 0);
    result = func_020954b4();
    func_02095584(1);
    func_020954f4(result);
}
