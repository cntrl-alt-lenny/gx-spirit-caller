extern char data_ov002_022cf1ac[];
extern char data_ov002_022cf1a8[];
extern int func_ov002_021ba034(int player, int idx);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021b31b8(int a0, int a1, int id, int a3);
extern int func_ov002_021c1ad0(int self, int idx);
extern int func_ov002_021c1d4c(int self, int idx);
/* The original caller supplies only two arguments to this four-argument thunk. */
extern int func_ov002_021c8940();

int func_ov002_021c0be4(int self, int idx) {
    int id = func_ov002_021ba034(self, idx);
    int off = (self & 1) * 0x868;
    int slot = idx * 20;
    int flag;
    if (((*(unsigned int *)(data_ov002_022cf1ac + off + slot) >> 6) & 1) == 0) {
        switch (id) {
        case 0x139f: case 0x1416: case 0x14d6: case 0x1588:
        case 0x1651: case 0x168b: case 0x16ff: case 0x1728:
        case 0x1835: case 0x18ab: case 0x18fd: case 0x194d:
        case 0x1991: case 0x19c9: case 0x1a21: case 0x1a53:
        case 0x1aab: case 0x1aae: case 0x1b2b:
            return 1;
        case 0x154c: case 0x196b: case 0x196c: case 0x196d: case 0x196e:
            if (func_ov002_021b3ecc(self, idx, id) != 0) return 1;
            break;
        case 0x1a1d:
            if (*(int *)(data_ov002_022cf1a8 + off + slot) == 0x191c) return 1;
            break;
        }
    }
    if (func_ov002_021b3ecc(self, idx, 0x1a0f) != 0) return 1;
    flag = func_ov002_021c1d4c(self, idx) & 1;
    if (flag <= 0) {
        if (func_ov002_021b3ecc(self, 11, 0x15f2) != 0) return 1;
    }
    switch (func_ov002_021c8940(self, idx)) {
    case 11: case 12: case 16:
        if (func_ov002_021bae7c(self, 0x16fc, -1) != 0) return 1;
        break;
    case 1:
        if (flag <= 0) {
            if (func_ov002_021bae7c(self, 0x14e3, -1) != 0) return 1;
        }
        break;
    }
    if ((func_ov002_021c1ad0(self, idx) & 1) <= 0) {
        if (id == 0xfcb || id == 0xfcc || id == 0x147b) {
            if (func_ov002_021bae7c(self, 0x187d, -1) != 0) return 1;
        }
        if (func_ov002_021b31b8(self, idx, 0x1408, self) != 0) return 1;
        if (func_ov002_021b31b8(self, idx, 0x1625, self) != 0) return 1;
        if (func_ov002_021b31b8(self, idx, 0x1496, self) != 0) return 1;
        if (func_ov002_021b31b8(self, idx, 0x15ce, self) != 0) return 1;
        if (func_ov002_021b31b8(self, idx, 0x1620, self) != 0) return 1;
    }
    return 0;
}
