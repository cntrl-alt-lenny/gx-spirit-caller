typedef struct {
    int field0;
    char pad1[0xc - 4];
    unsigned short field0xc;
    unsigned short field0xe;
    char pad2[0x12 - 0xe - 2];
    unsigned short field12;
} T_0207f914;

void func_0207f914(T_0207f914 *p, unsigned short a1, unsigned short a2) {
    if (p->field0 == 1) {
        p->field12 |= 8;
        p->field0xc = a1;
        p->field0xe = a2;
    }
}
