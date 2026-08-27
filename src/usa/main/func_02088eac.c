typedef struct {
    int field_0;
    int field_4;
    char pad_8[0x4c - 8];
    int field_4c;
} data_021a524c_t;

extern data_021a524c_t data_021a516c;
extern void func_0208878c(void);
extern void func_0208afbc(void *p, int arg1, int arg2);

void func_02088eac(int a0) {
    data_021a524c_t *p = &data_021a516c;
    if (p->field_0 == 0) {
        goto ret1;
    }
    if (p->field_4 != 0) {
        goto ret2;
    }
    if (a0 == 0) {
        func_0208878c();
        return;
    }
    func_0208afbc((char *)p + 0x3c, 0, a0);
    p->field_4c = 1;
    return;
ret1:
    return;
ret2:
    return;
}
