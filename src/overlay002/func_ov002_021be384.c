extern int func_ov002_021b9ecc(int a0, int a1, int a2);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bdde0(int a0, int a1);
extern int func_ov002_021be4a0(int a0, int a1, int a2);
extern unsigned char data_ov002_022cf1a2[];
extern unsigned char data_ov002_022cf1a4[];
extern unsigned char data_ov002_022cf1ac[];

int func_ov002_021be384(int a0, int a1, int a2) {
    int ret;
    int rowOff;
    int idxOff;

    ret = func_ov002_021b9ecc(a0, a1, a2);
    if (ret == 0) {
        return 0;
    }

    rowOff = (a0 & 1) * 0x868;
    idxOff = a1 * 0x14;

    if (*(unsigned short *)(data_ov002_022cf1a4 + rowOff + idxOff) == 0) {
        return 0;
    }

    if (*(unsigned short *)(data_ov002_022cf1a2 + rowOff + idxOff) != 0) {
        switch (ret) {
        case 0x12b4:
            if ((*(unsigned int *)(data_ov002_022cf1ac + rowOff + idxOff) >> 6) & 1) {
                return 0;
            }
            break;
        case 0x1956:
            if ((*(unsigned int *)(data_ov002_022cf1ac + rowOff + idxOff) >> 6) & 1) {
                return 0;
            }
            if (func_ov002_021bbf50(1 - a0) != 0) {
                return 0;
            }
            break;
        default:
            return 0;
        }
    }

    if (func_ov002_021bdde0(a0, a1) != 0) {
        return 0;
    }
    return func_ov002_021be4a0(a0, a1, a2);
}
