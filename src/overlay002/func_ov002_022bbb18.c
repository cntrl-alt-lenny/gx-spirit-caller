typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
typedef struct { signed char kind; char pad[11]; int value; } Entry;
typedef struct { int active; int id; } Pair;
extern char data_ov002_022d1410[];
extern Pair data_ov002_022d28fc[];
extern char data_ov002_022ccfd8[];
extern char data_ov002_022ccfec[];
extern int data_ov002_022d1af8[];
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
extern int func_020a978c(char *dest, const char *format, ...);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int contains(int i, Pair *p) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == 0x4b) return 1;
    }
    return 0;
}
int func_ov002_022bbb18(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Selection selection = *(Selection *)(self + 0xc68);
        Entry *entry = func_ov002_022a6324(data_ov002_022d1410, selection.index, selection.type, selection.sub);
        func_ov002_022bdb88(data_ov002_022d28fc, 0x4b, 0, self + 0xc80, 0);
        { char *dest = self + 0x99c; int value; if (entry->kind) value = entry->value; else value = 0xfe0; func_020a978c(dest, data_ov002_022ccfd8, value); }
        func_020a978c(self + 0x9c4, data_ov002_022ccfec);
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xd38) = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Pair *p = data_ov002_022d28fc;
        if (*(int *)(self + 0xc64) == 33)
            func_02037208(0x33, -1, 0, 1);
        if (*(int *)(self + 0xc64) == 45)
            *(int *)(self + 0xd38) = 1;
        if (contains(0, p)) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xd38) = 0;
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}


