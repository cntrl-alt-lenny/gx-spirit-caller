typedef struct {
    int obj;
    int idx;
} Slot_ov002_022bdb88;

typedef struct {
    void *res;
    int count;
} Def_ov002_022bdb88;

extern Def_ov002_022bdb88 data_ov002_022cd090[];
extern int func_020211c8(void *);
extern int func_0202147c(int);
extern int func_02021650(int, void *, void *);
extern int func_02021660(int, int, int);
extern void func_020216b0(int, int, int);
extern void func_ov002_022bdd44(int *obj);

int func_ov002_022bdb88(Slot_ov002_022bdb88 *slots, int idx, unsigned int pos, int *v1, int *v2) {
    Def_ov002_022bdb88 *def = &data_ov002_022cd090[idx];
    Slot_ov002_022bdb88 *slot;
    int i;
    int h;
    int x, y;
    int n;

    for (n = 0; n < 16; n++) {
        if (slots[n].obj == 0) {
            break;
        }
    }
    if (n == 16) {
        return 0;
    }
    slot = &slots[n];
    slot->obj = func_020211c8(def->res);
    slot->idx = idx;
    func_0202147c(slots[n].obj);
    func_02021650(slots[n].obj, func_ov002_022bdd44, slot);
    {
        unsigned short lo = pos;
        unsigned short hi = pos >> 16;
        x = (short)lo;
        y = (short)hi;
    }
    for (i = 0; i < def->count; i++) {
        h = func_02021660(slot->obj, 3, i);
        func_020216b0(h, 13, x);
        func_020216b0(h, 15, y);
        if (v1 == 0) {
            func_020216b0(h, 3, 0);
            func_020216b0(h, 4, 0);
            func_020216b0(h, 5, 0);
        } else {
            func_020216b0(h, 3, v1[0]);
            func_020216b0(h, 4, v1[1]);
            func_020216b0(h, 5, v1[2]);
        }
        if (v2 == 0) {
            func_020216b0(h, 6, 0);
            func_020216b0(h, 7, 0);
            func_020216b0(h, 8, 0);
        } else {
            func_020216b0(h, 6, v2[0]);
            func_020216b0(h, 7, v2[1]);
            func_020216b0(h, 8, v2[2]);
        }
    }
    return slot->obj;
}
