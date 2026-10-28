typedef struct { int active; int id; } Pair;
extern Pair data_ov002_022d28fc[];
extern int data_ov002_022d1af8[];
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
static inline int contains(int i, Pair *p) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == 0x1a) return 1;
    }
    return 0;
}
int func_ov002_022bced8(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0:
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1:
        if (*(int *)(self + 0xc64) >= 45) {
            func_ov002_022bdb88(data_ov002_022d28fc, 0x1a, *(int *)(self + 0xc58), 0, 0);
            *(int *)(self + 0xc60) = 2;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    case 2: {

        Pair *p;
        int t = *(int *)(self + 0xc64) - 30;
        int q = t / 9;


        p = data_ov002_022d28fc;
        if (t % 9 == 0 && q >= 0 && q < 20)
            func_02037208(0x5a, -1, 0, 1);

        if (*(int *)(self + 0xc64) == 0xe4) func_02037208(0x5b, -1, 0, 1);

        if (contains(0, p)) break;
        *(int *)(self + 0xc60) = 3;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 3:
        if (*(int *)(self + 0xc64) >= 15) {
            *(int *)(self + 0xc60) = 4;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    case 4:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}






