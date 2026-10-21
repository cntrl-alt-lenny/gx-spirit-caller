typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
typedef struct { int active; int id; } Pair;
extern Pair data_ov002_022d28fc[];
extern char data_ov002_022ccfd8[];
extern char data_ov002_022ccfec[];
extern int data_ov002_022d1af8[];
extern int func_0202de9c(int unused0);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_020a978c(char *dst, const char *fmt, ...);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
static inline int map_kind(int value) {
    if (value == 8) return 0;
    if (value == 7) return 1;
    if (value == 3) return 3;
    if (value == 2) return 4;
    return 2;
}
static inline int contains(Pair *p, int flag) {
    int i;
    for (i = 0; i < 16; i++, p++) {
        if (p->active && p->id == (flag ? 0x30 : 0x31)) return 1;
    }
    return 0;
}
int func_ov002_022bb074(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Selection selection = *(Selection *)(self + 0xc68);
        Pair *array = data_ov002_022d28fc;
        int flag = selection.type < 16 ? 1 : 0;
        int kind;
        int extra;
        kind = map_kind(func_0202de9c(*(int *)(self + 0xc5c)));
        extra = selection.type == 14 ? 0x100 : 0;
        extra |= kind;
        func_ov002_022bdb88(array, flag ? 0x30 : 0x31, extra, self + 0xc80, 0);
        func_020a978c(self + 0x924, data_ov002_022ccfd8, *(int *)(self + 0xc5c));
        func_020a978c(self + 0x94c, data_ov002_022ccfec);
        if (flag) func_02037208(0x41, -1, 0, 1);
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xcf0) = flag ? 0 : 1;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Selection selection = *(Selection *)(self + 0xc68);
        Pair *array = data_ov002_022d28fc;
        int flag = selection.type < 16 ? 1 : 0;
        if (!flag && *(int *)(self + 0xc64) == 0x2d) func_02037208(0x41, -1, 0, 1);
        if (contains(array, flag)) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xcf0) = 0;
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}




