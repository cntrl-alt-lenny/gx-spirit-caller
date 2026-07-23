typedef struct {
    int field0;
    int field4;
    int field8;
    char pad[0x12 - 0xc];
    unsigned short field12;
} T_0207f8d8;

void func_0207f8d8(T_0207f8d8 *p, int a1, int a2) {
    if (p->field0 == 1) {
        p->field12 |= 2;
        p->field4 = a1;
        p->field8 = a2;
    }
}
