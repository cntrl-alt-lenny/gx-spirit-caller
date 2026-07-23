typedef struct {
    int field0;
    char pad[0x10 - 4];
    unsigned short field10;
    unsigned short field12;
} T_0207f8f8;

void func_0207f8f8(T_0207f8f8 *p, unsigned short value) {
    if (p->field0 == 1) {
        p->field12 |= 4;
        p->field10 = value;
    }
}
