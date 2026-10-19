typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
typedef struct { unsigned short pad[5]; unsigned short value:15; unsigned short flag:1; } Entry;
typedef struct { int active; int id; } Pair;
extern char data_ov002_022d1410[];
extern Pair data_ov002_022d28fc[];
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int contains(int i) {
    int *p = (int *)data_ov002_022d28fc;
    for (; i < 16; i++, p += 2) {
        if (p[0] && p[1] == 0x35) return 1;
    }
    return 0;
}
int func_ov002_022bb6fc(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Pair *array = data_ov002_022d28fc;
        Selection selection = *(Selection *)(self + 0xc68);
        Entry *entry = func_ov002_022a6324(data_ov002_022d1410, selection.index, selection.type, selection.sub);
        int flag = entry->flag ? 1 : 0;
        int extra = *(int *)(self + 0xcf8) != 0 ? 2 : 0;
        func_ov002_022bdb88(array, 0x35, extra | flag, self + 0xc80, 0);
        func_02037208(0x93, -1, 0, 1);
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        if (contains(0)) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2:
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}










