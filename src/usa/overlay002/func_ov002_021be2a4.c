extern int func_ov002_021b9dec(int a0, int a1, int a2);
extern int func_ov002_021bbe70(int arg0);
extern int func_ov002_021bdd00(int a0, int a1);
extern int func_ov002_021be3c0(int a0, int a1, int a2);
extern unsigned char data_ov002_022cf0c2[];
extern unsigned char data_ov002_022cf0c4[];
extern unsigned char data_ov002_022cf0cc[];

int func_ov002_021be2a4(int a0, int a1, int a2) {
    int ret;
    int rowOff;
    int idxOff;

    ret = func_ov002_021b9dec(a0, a1, a2);
    if (ret == 0) {
        return 0;
    }

    rowOff = (a0 & 1) * 0x868;
    idxOff = a1 * 0x14;

    if (*(unsigned short *)(data_ov002_022cf0c4 + rowOff + idxOff) == 0) {
        return 0;
    }

    if (*(unsigned short *)(data_ov002_022cf0c2 + rowOff + idxOff) != 0) {
        switch (ret) {
        case 0x12b4:
            if ((*(unsigned int *)(data_ov002_022cf0cc + rowOff + idxOff) >> 6) & 1) {
                return 0;
            }
            break;
        case 0x1956:
            if ((*(unsigned int *)(data_ov002_022cf0cc + rowOff + idxOff) >> 6) & 1) {
                return 0;
            }
            if (func_ov002_021bbe70(1 - a0) != 0) {
                return 0;
            }
            break;
        default:
            return 0;
        }
    }

    if (func_ov002_021bdd00(a0, a1) != 0) {
        return 0;
    }
    return func_ov002_021be3c0(a0, a1, a2);
}
