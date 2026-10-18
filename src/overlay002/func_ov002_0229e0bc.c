typedef struct {
    unsigned short lo : 14;
    unsigned short b14 : 1;
    unsigned short b15 : 1;
} Bits;

typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short f4;
    unsigned short f6;
    unsigned short f8;
    Bits fa;
    char pad[8];
} Entry;

typedef struct {
    char pad0[4];
    Entry e[8];
    char pad1[0xa4 - 4 - 8 * 0x14];
    int count;
} Obj;

void func_ov002_0229e0bc(Obj *p, int v) {
    int i;
    Entry *e;
    if (v == 0) return;
    e = (Entry *)p;
    for (i = 0; i < 8; i++, e++) {
        if (i < p->count) {
            Bits t = e->fa;
            t.b14 = (unsigned short)v;
            t.b15 = 0;
            e->fa = t;
            e->f4 = 8;
        }
    }
}
