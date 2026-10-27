typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct { Obj *active; int id; } Pair;
extern Pair data_ov002_022d28fc[];
extern int data_ov002_022d1af8[];
extern int data_021040ac[];
extern Obj *func_ov002_022bdb88(Pair *array, int id, int flags, void *position, void *end);
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int contains(int i, Pair *p, int id) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == id) return 1;
    }
    return 0;
}
int func_ov002_022bccec(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0:
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1: {
        if (*(int *)(self + 0xc64) < 45) break;
        Pair *array = data_ov002_022d28fc;
        Obj *obj;
        int value;
        int id;
        if (data_021040ac[13] == 0) id = 0x3d;
        else id = 0x18;
        obj = func_ov002_022bdb88(array, id, *(int *)(self + 0xc58), 0, 0);
        value = func_02021660(obj, 6, 0);
        func_020216b0((void *)value, 13, *(int *)(self + 0xc58));
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2: {
        Pair *p = data_ov002_022d28fc;
        if (*(int *)(self + 0xc58) == 5) {
            if (*(int *)(self + 0xc64) == 9 || *(int *)(self + 0xc64) == 24 || *(int *)(self + 0xc64) == 39 || *(int *)(self + 0xc64) == 54 || *(int *)(self + 0xc64) == 69) func_02037208(0x5b, -1, 0, 1);
            if (*(int *)(self + 0xc64) == 180) func_02037208(0x5c, -1, 0, 1);
        } else if (*(int *)(self + 0xc64) == 24) func_02037208(0x60, -1, 0, 1);
        if (contains(0, p, data_021040ac[13] == 0 ? 0x3d : 0x18)) break;
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
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}




