extern int func_ov002_021b3ecc(int, int, int);
extern int func_ov002_021b3fd8(int, int, int, int);
extern int func_ov002_021b4098(int, int, int);
extern int func_ov002_021bae7c(int, int, int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021c9e14(int);

int func_ov002_021c9c94(int arg0) {
    if ((func_ov002_021bb068(0x135D) != 0) &&
        (func_ov002_021c9e14(arg0) == 0)) {
        return 0;
    }
    if (func_ov002_021b4098(arg0, 0xB, 0x15AD) != 0) {
        return 0;
    }
    if (func_ov002_021b3fd8(arg0, 0xB, 0x1679, 1) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x1578) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x1A92) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x1A1B) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x1436) != 0) {
        return 0;
    }
    if (func_ov002_021bae7c(arg0, 0x1972, -1) == 0) {
        return 1;
    }
    return 0;
}
