typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
typedef struct { unsigned short pad[5]; unsigned short value:15; unsigned short flag:1; } Entry;
typedef struct { int active; int id; } Pair;
extern char data_ov002_022d1410[];
extern Pair data_ov002_022d28fc[];
extern int data_ov002_022d1af8[];
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, void *arg);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int pack(int high, int low) { unsigned short a = high; unsigned short b = low; return (a << 16) | b; }
static inline int contains(Pair *p, int i, int id) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == id) return 1;
    }
    return 0;
}
int func_ov002_022bbe88(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        unsigned short lo, hi;
        int count, flag, other;

        Entry *entry;
        int flags, upper;
        if (*(int *)(self + 0xc64) < 15) break;
        lo = (unsigned short)*(unsigned int *)(self + 0xc58);
        count = lo & 255;
        flag = (lo >> 8) & 255;
        hi = (unsigned short)(*(unsigned int *)(self + 0xc58) >> 16);
        other = hi & 255;
        if (count > 99) count = 99;
        if (other > 99) { other = 99; count = 0; }
        Selection selection = *(Selection *)(self + 0xc68);
        entry = func_ov002_022a6324(data_ov002_022d1410, selection.index, selection.type, selection.sub);
        Pair *array = data_ov002_022d28fc;
        int entryFlag = entry->flag ? 0x200 : 0;
        int lowFlags = count | (flag ? 0x100 : 0);
        int modeFlag = *(int *)(self + 0xd0c) == 2 ? 0x400 : 0;
        flags = (lowFlags | entryFlag) | modeFlag;
        upper = other;
        func_ov002_022bdb88(array, *(int *)(self + 0xd0c) == 0 ? 15 : 63, pack(upper, flags), self + 0xc80, 0);
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Pair *p = data_ov002_022d28fc;
        if (((unsigned short)*(int *)(self + 0xc58) >> 8) & 255) {
            if (*(int *)(self + 0xc64) == 27) func_02037208(0x58, -1, 0, 1);
        } else {
            if (*(int *)(self + 0xc64) == 72) func_02037208(0x59, -1, 0, 1);
        }
        if (contains(p, 0, *(int *)(self + 0xd0c) == 0 ? 15 : 63)) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}





