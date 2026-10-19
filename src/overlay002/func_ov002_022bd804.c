typedef struct { int active; int id; } Pair;
extern char data_ov002_022d1af8[];
extern Pair data_ov002_022d28fc[];
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
static inline int contains(int i) {
    int *p = (int *)data_ov002_022d28fc;
    for (; i < 16; i++, p += 2) {
        if (p[0] && p[1] == 0x19) return 1;
    }
    return 0;
}
int func_ov002_022bd804(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0:
        *(int *)(data_ov002_022d1af8 + 4) = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1:
        if (*(int *)(self + 0xc64) < 15) break;
        func_ov002_022bdb88(data_ov002_022d28fc, 0x19, *(int *)(self + 0xc58), 0, 0);
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    case 2:
        if (contains(0)) break;
        *(int *)(self + 0xc60) = 3;
        *(int *)(self + 0xc64) = 0;
        break;
    case 3:
        if (*(int *)(self + 0xc64) < 15) break;
        *(int *)(self + 0xc60) = 4;
        *(int *)(self + 0xc64) = 0;
        break;
    case 4:
        *(int *)(data_ov002_022d1af8 + 4) = 1;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}
