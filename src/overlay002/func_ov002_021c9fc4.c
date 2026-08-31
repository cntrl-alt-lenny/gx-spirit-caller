#include "ov002_core.h"

extern int func_ov002_021b3ecc(int, int, int);
extern int func_ov002_021b3fd8(int, int, int, int);
extern int func_ov002_021bae7c(int, int, int);
extern int func_ov002_021bb068(int);
extern char data_ov002_022cf288[];

int func_ov002_021c9fc4(int arg0) {
    if (((*(unsigned int *)(data_ov002_022cf288 + ((arg0 & 1) * 0x868)) >> 0x15) & 1) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x12D2) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x12DE) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x1710) != 0) {
        return 0;
    }
    if (func_ov002_021b3ecc(arg0, 0xB, 0x1973) != 0) {
        return 0;
    }
    if (func_ov002_021bae7c(arg0, 0x13FF, -1) != 0) {
        return 0;
    }
    if (func_ov002_021bb068(0x12B1) != 0) {
        return 0;
    }
    if (func_ov002_021b3fd8(arg0, 0xB, 0x1679, 1) == 0) {
        return 1;
    }
    return 0;
}
