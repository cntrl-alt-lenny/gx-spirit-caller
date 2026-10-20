extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021b4098(int arg0, int arg1, int arg2);
extern int func_ov002_021bae7c(int arg0, int arg1, int arg2);
extern int func_ov002_021bb068(int arg0);
extern char data_ov002_022cf288[];

int func_ov002_021c9e14(int arg0) {
    if (((*(unsigned int *)(data_ov002_022cf288 + (arg0 & 1) * 0x868) >> 21) & 1) != 0)
        return 0;
    if (func_ov002_021b3ecc(arg0, 11, 0x12d2) != 0) return 0;
    if (func_ov002_021b3ecc(arg0, 11, 0x12de) != 0) return 0;
    if (func_ov002_021b3ecc(arg0, 11, 0x1710) != 0) return 0;
    if (func_ov002_021b3ecc(arg0, 11, 0x1973) != 0) return 0;
    if (func_ov002_021bae7c(arg0, 0x13ff, -1) != 0) return 0;
    if (func_ov002_021bb068(0x12b1) != 0) return 0;
    if (func_ov002_021b4098(arg0, 11, 0x15ad) != 0) return 0;
    if (func_ov002_021b3fd8(arg0, 11, 0x1679, 1) != 0) return 0;
    if (func_ov002_021b3ecc(arg0, 11, 0x1578) != 0) return 0;
    if (func_ov002_021b3ecc(arg0, 11, 0x1a92) != 0) return 0;
    if (func_ov002_021b3ecc(arg0, 11, 0x1436) != 0) return 0;
    return func_ov002_021bae7c(arg0, 0x1972, -1) == 0;
}
