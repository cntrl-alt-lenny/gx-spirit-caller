typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
typedef struct { unsigned short pad[5]; unsigned short value:15; unsigned short flag:1; } Entry;
typedef struct { int active; int id; } Pair;
typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
extern char data_ov002_022d1410[];
extern Pair data_ov002_022d28fc[];
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
extern int func_ov002_022b867c(char *self, int idx, int type, int sub, int *out);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, void *end);
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int contains(Pair *p) {
    int i;
    for (i = 0; i < 16; i++, p++) {
        if (p->active && p->id == 0x39) return 1;
    }
    return 0;
}
int func_ov002_022bb294(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Pair *array = data_ov002_022d28fc;
        char *base = data_ov002_022d1410;
        Entry *entry;

        int end[3];
        int start[3];
        void *obj;
        if (*(int *)(self + 0xc64) < 15) break;
        { Selection *selection = (Selection *)(self + 0xc6c);
        entry = func_ov002_022a6324(base, selection->index, selection->type, selection->sub); }
        { Selection *selection = (Selection *)(self + 0xc6a);
        func_ov002_022b867c(self, selection->index, selection->type, selection->sub, start); }
        { Selection *selection = (Selection *)(self + 0xc6c);
        func_ov002_022b867c(self, selection->index, selection->type, selection->sub, end); }
        func_ov002_022bdb88(array, 0x39, entry->flag, start, end);
        obj = (void *)func_02021660(*(Obj **)self, 1, 0);
        func_020216b0(obj, 6, end[0]);
        func_020216b0(obj, 7, end[1]);
        func_020216b0(obj, 8, end[2] - 0x40);
        func_020216b0(obj, 9, end[0]);
        func_020216b0(obj, 10, 0x60);
        func_020216b0(obj, 11, end[2] + 0x60);
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Pair *array = data_ov002_022d28fc;
        if (*(int *)(self + 0xc64) == 0x3c) func_02037208(0x3c, -1, 0, 1);
        if (contains(array)) break;
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


