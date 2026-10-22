typedef struct { int active; int id; } Pair;
extern Pair data_ov002_022d28fc[];
extern int data_ov002_022d1af8[];
extern int data_ov002_022d0f2c[];
extern int data_ov002_022ccc48[];
extern char data_ov002_022ccfd8[];
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_02037dc0(int modeArg, void *arg1, void *arg2);
extern int func_020a978c(char *dest, const char *format, ...);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
static inline int contains(int i, Pair *p) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == 0x15) return 1;
    }
    return 0;
}
int func_ov002_022bca80(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0:
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1:
        if (*(int *)(self + 0xc64) == 8) func_02037dc0(data_ov002_022d0f2c[0x36], 0, 30);
        if (*(int *)(self + 0xc64) == 0x27) func_02037208(0x2d, -1, 0, 1);
        if (*(int *)(self + 0xc64) >= 0x2d) {
            int i;
            char *dest;
            func_ov002_022bdb88(data_ov002_022d28fc, 0x15, 0, 0, 0);
            dest = self + 0x924;
            for (i = 0; i < 5; i++, dest += 0x28) {
                func_020a978c(dest, data_ov002_022ccfd8, data_ov002_022ccc48[i]);
            }
            *(int *)(self + 0xc60) = 2;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    case 2: {
        Pair *p = data_ov002_022d28fc;
        if (*(int *)(self + 0xc64) == 0x37 || *(int *)(self + 0xc64) == 0x46 || *(int *)(self + 0xc64) == 0x55 || *(int *)(self + 0xc64) == 0x64 || *(int *)(self + 0xc64) == 0x73) func_02037208(0x52, -1, 0, 1);
        if (*(int *)(self + 0xc64) == 0xbe) func_02037208(0x50, -1, 0, 1);
        if (contains(0, p)) break;
        func_ov002_022bdb88(p, 0x16, 0, 0, 0);
        *(int *)(self + 0xc60) = 3;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 3:
        if (*(int *)(self + 0xc64) == 0xe1) func_02037208(0x51, -1, 0, 1);
        if (*(int *)(self + 0xc64) >= 0x12c) {
            *(int *)(self + 0xc60) = 4;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    case 4:
        if (*(int *)(self + 0xc64) >= 0xf) {
            *(int *)(self + 0xc60) = 5;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    case 5:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}


