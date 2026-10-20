extern int func_ov002_021b9ecc(int a0, int a1);
extern int func_ov002_021bc8c8(int a0, int a1, int a2);
extern char data_ov002_022cf1ac[];
extern char data_ov002_022cf1a4[];

int func_ov002_021bc72c(int a0, int a1, int a2) {
    switch (func_ov002_021b9ecc(a1, a2)) {
    case 0x1422:
    case 0x14f8:
    case 0x14f9:
    case 0x154f:
    case 0x1550:
    case 0x1551:
    case 0x1670:
    case 0x1671:
    case 0x1672:
        return 0;
    case 0x19ee:
        if ((*(unsigned int *)(data_ov002_022cf1ac + (a1 & 1) * 0x868 + a2 * 20) >> 18) & 1)
            return 0;
        break;
    case 0x1836:
        {
            int off = (a1 & 1) * 0x868;
            unsigned int f = *(unsigned int *)(data_ov002_022cf1ac + off + a2 * 20);
            unsigned short h = *(unsigned short *)(data_ov002_022cf1a4 + off + a2 * 20);
            if ((h & ~((f >> 6) & 1)) & ~(((f >> 1) | (f >> 2)) & 1))
                return 0;
        }
        break;
    }
    return func_ov002_021bc8c8(a0, a1, a2);
}

