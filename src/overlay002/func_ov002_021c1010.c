extern char data_ov002_022cf1ac[];
extern int func_ov002_021b9ecc(int self, int arg1);
extern void func_ov002_021b1f20(int self, int arg1, int a2, int a3, int a4);

void func_ov002_021c1010(int self, int arg1) {
    unsigned int *p = (unsigned int *)(data_ov002_022cf1ac + (self & 1) * 0x868 + arg1 * 20);
    *p |= 0x200000;
    *p |= 1 << (((*p >> 22) & 1) ? 0x17 : 0x16);
    switch (func_ov002_021b9ecc(self, arg1)) {
    case 0x186c:
    case 0x18a6:
    case 0x19c1:
    case 0x1a4e:
        func_ov002_021b1f20(self, arg1, 1, func_ov002_021b9ecc(self, arg1), 0);
        break;
    }
}
