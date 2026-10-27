typedef struct { int active; int id; } Pair;
typedef struct { unsigned short a:1; unsigned short value:5; unsigned short b:10; } Bits;
extern Pair data_ov002_022d28fc[];
extern int data_ov002_022d1af8[];
extern char data_ov002_022ccfd8[];
extern int func_02037208(int, int, int, int);
extern int func_020a978c(char *, const char *, ...);
extern int func_ov002_022bdb88(Pair *, int, int, void *, int);
static inline int contains(int i, Pair *p) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == 14) return 1;
    }
    return 0;
}
int func_ov002_022bc0b8(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        int id = *(int *)(self + 0xc5c);
        int flags = *(int *)(self + 0xc58);
        int good;
        Bits bits;
        if (id == 0x169c) {
            flags = 20 - flags;
            if (flags > 98) flags = 98;
            else if (flags < 0) flags = 0;
        } else {
            if (flags > 99) flags = 99;
            else if (flags < 1) flags = 1;
        }
        bits = *(Bits *)(self + 0xc68);
        good = bits.value < 16;
        if (!good) flags |= 0x100;
        else if (bits.value < 4) flags |= 0x200;
        if (id == 0x169c) flags |= 0x400;
        func_ov002_022bdb88(data_ov002_022d28fc, 14, flags, self + 0xc80, 0);
        func_020a978c(self + 0x924, data_ov002_022ccfd8, *(int *)(self + 0xc5c));
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xcf0) = !good;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Pair *p = data_ov002_022d28fc;

        if (*(int *)(self + 0xc5c) == 0x169c) {
            if (*(int *)(self + 0xc64) == 0x12) func_02037208(0x5b, -1, 0, 1);
        } else if (*(int *)(self + 0xc64) == 0x30) func_02037208(0x5d, -1, 0, 1);
        if (!contains(0, p)) {
            *(int *)(self + 0xc60) = 2;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    }
    case 2:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xcf0) = 0;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}



