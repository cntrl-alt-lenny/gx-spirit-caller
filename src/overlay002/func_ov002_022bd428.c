typedef struct { int active; int id; } Pair;
extern char data_ov002_022d1af8[];
extern Pair data_ov002_022d28fc[];
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int contains(Pair *p, int i) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == 7) return 1;
    }
    return 0;
}
int func_ov002_022bd428(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0:
        *(int *)(data_ov002_022d1af8 + 4) = 0;
        *(int *)(self + 0xc48) = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1:
        if (*(int *)(self + 0xc64) < 15) break;
        func_ov002_022bdb88(data_ov002_022d28fc, 7, *(int *)(self + 0xc58), 0, 0);
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    case 2: {
        Pair *p = data_ov002_022d28fc;
        int t = *(int *)(self + 0xc64);
        if (t == 75 || t == 90) {
            func_02037208(0x3b, -1, 0, 1);
        } else if (t == 155) {
            func_02037208(0x4a, -1, 0, 1);
        }
        if (contains(p, 0)) break;
        *(int *)(self + 0xc60) = 3;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 3:
        if (*(int *)(self + 0xc64) < 15) break;
        *(int *)(self + 0xc60) = 4;
        *(int *)(self + 0xc64) = 0;
        break;
    case 4:
        *(int *)(data_ov002_022d1af8 + 4) = 1;
        *(int *)(self + 0xc48) = 1;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}
