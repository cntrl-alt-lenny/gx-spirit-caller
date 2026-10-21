typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
typedef struct { signed char kind; char pad[9]; unsigned short value:15; unsigned short flag:1; int id; } Entry;
typedef struct { int active; int id; } Pair;
extern char data_ov002_022d1410[];
extern Pair data_ov002_022d28fc[];
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern int func_ov002_022b867c(char *self, int idx, int type, int sub, int *out);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, void *end);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int contains(Pair *p, int id) {
    int i;
    for (i = 0; i < 16; i++, p++) {
        if (p->active && p->id == id) return 1;
    }
    return 0;
}
int func_ov002_022bb4b8(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Selection selection = *(Selection *)(self + 0xc68);
        Pair *array = data_ov002_022d28fc;
        Entry *entry = func_ov002_022a6324(data_ov002_022d1410, selection.index, selection.type, selection.sub);
        int flags;
        if (*(int *)(self + 0xc64) < 15) break;
        func_ov002_022b867c(self, selection.index, selection.type, selection.sub, (int *)(self + 0xc80));
        if (*(int *)(self + 0xc58) == 0) {
            int flag;
            if (entry->kind == 0) flag = 4;
            else flag = entry->flag ? 2 : 0;
            flags = selection.type == 11 ? 1 : 0; flags |= flag;
        } else flags = selection.type == 11 ? 1 : 0;
        func_ov002_022bdb88(array, *(int *)(self + 0xc58) == 0 ? 0x3a : 0x36, flags, self + 0xc80, 0);
        ((int *)(self + 0xcb0))[*(int *)(self + 0xcc4)] = entry->kind ? entry->id : 0xfe0;
        (*(int *)(self + 0xcc4))++;
        if (*(int *)(self + 0xcc4) >= 5) *(int *)(self + 0xcc4) = 0;
        *(int *)(self + 0xd34) = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Pair *array = data_ov002_022d28fc;
        if (*(int *)(self + 0xc64) == 3) func_02037208(0x3f, -1, 0, 1);
        else if ((*(int *)(self + 0xc58) == 0 && *(int *)(self + 0xc64) == 0x2d) || (*(int *)(self + 0xc58) != 0 && *(int *)(self + 0xc64) == 0x19))
            *(int *)(self + 0xd34) = 1;
        if (contains(array, *(int *)(self + 0xc58) == 0 ? 0x3a : 0x36)) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2:
        *(int *)(self + 0xd34) = 0;
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xcd0) = 3;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}


