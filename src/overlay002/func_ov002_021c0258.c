extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bd6c8(int a);

int func_ov002_021c0258(int arg0) {
    int i;
    char *p = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    for (i = 0; i < 5; i++, p += 0x14) {
        int r = func_ov002_021b9ecc(arg0, i);
        if (r != 0) {
            unsigned int v = *(unsigned int *)(p + 0x40);
            unsigned int h = *(unsigned short *)(p + 0x38);
            if ((h & ~((v >> 6) & 1)) & ~(((v >> 1) | (v >> 2)) & 1)) {
                switch (r) {
                case 0x13cd:
                    if (func_ov002_021bd6c8(0x10f4) != 0)
                        continue;
                    break;
                case 0x164e:
                    continue;
                }
            }
            return 1;
        }
    }
    return 0;
}
