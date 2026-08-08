typedef struct {
    int field_0;
    int field_4;
    char pad_8[0x4c - 8];
    int field_4c;
} data_021a524c_t;

extern data_021a524c_t data_021a524c;
extern void func_02088874(void);
extern void func_0208b0a4(void *p, int arg1, int arg2);

void func_02088f94(int a0) {
    data_021a524c_t *p = &data_021a524c;
    if (p->field_0 == 0) {
        goto ret1;
    }
    if (p->field_4 != 0) {
        goto ret2;
    }
    if (a0 == 0) {
        func_02088874();
        return;
    }
    func_0208b0a4((char *)p + 0x3c, 0, a0);
    p->field_4c = 1;
    return;
ret1:
    return;
ret2:
    return;
}
