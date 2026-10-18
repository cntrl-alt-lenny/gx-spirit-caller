extern char data_ov002_022cf1ac[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int self, int arg1);
extern int func_02031764(void);
extern int func_ov002_021bbd04(int self, int arg1);

int func_ov002_021c1954(int self, int arg1) {
    int off = (self & 1) * 0x868;
    unsigned int a = *(unsigned int *)(data_ov002_022cf1ac + off + arg1 * 20);
    unsigned int b = *(unsigned short *)(data_ov002_022cf1a4 + off + arg1 * 20);
    if ((b & ~((a >> 6) & 1)) & ~(((a >> 1) | (a >> 2)) & 1)) {
        int r = func_ov002_021b9ecc(self, arg1);
        if (func_02031764() != 0) {
            return 1;
        }
        if (r == 0x17e4 || r == 0x1826 || r == 0x1860) {
            if (func_ov002_021bbd04(self, 3) != 0 || func_ov002_021bbd04(1 - self, 3) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
