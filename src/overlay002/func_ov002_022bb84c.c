typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
typedef struct { signed char kind; char pad[9]; unsigned short value:14; unsigned short flag:1; unsigned short rest:1; } Entry;
typedef struct { int active; int id; } Pair;
extern char data_ov002_022d1410[];
extern Pair data_ov002_022d28fc[];
extern char data_ov002_022ccfd8[];
extern int data_ov002_022d1af8[];
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
extern int func_020a978c(char *dest, const char *format, ...);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int contains(Pair *p, int i) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == 0x34) return 1;
    }
    return 0;
}
int func_ov002_022bb84c(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Selection selection = *(Selection *)(self + 0xc68);
        Entry *entry = func_ov002_022a6324(data_ov002_022d1410, selection.index, selection.type, selection.sub);
        func_ov002_022bdb88(data_ov002_022d28fc, 0x34, 0, self + 0xc80, 0);
        { char *dest = self + 0x924; int value; if (entry->kind && !entry->flag) value = 0; else value = *(int *)(self + 0xc5c); func_020a978c(dest, data_ov002_022ccfd8, value); }
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Pair *p = data_ov002_022d28fc;
        if (*(int *)(self + 0xc64) == 15)
            func_02037208(0x4e, -1, 0, 1);
        if (contains(p, 0)) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xcd0) = 3;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}

