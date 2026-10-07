typedef struct {
    char pad0[8];
    void *ptrs[24];
    char pad68[0xd0 - 0x68];
    unsigned int wd0;
} Q;

typedef struct {
    char pad0[0x79];
    unsigned char n;
    char pad7a[2];
    int w7c;
    int w80;
    char pad84[0x98 - 0x84];
    Q q;
    char pad_q[0x16c - 0x98 - sizeof(Q)];
    int w16c;
    int w170;
    char pad174[0x18c - 0x174];
    short h18c;
    short h18e;
    short h190;
    char pad192[0x19a - 0x192];
    unsigned short b0 : 1;
    unsigned short b1 : 1;
    unsigned short b2 : 1;
    unsigned short b3 : 1;
} Obj;

extern void func_0201eaa0(int mode, void *p, int *xs, int z, int a, int b, int c, int d, int e, int f, int g, int h);

int func_02029a88(Obj *o) {
    int xs[2];
    Q *q = &o->q;
    int i;
    xs[0] = (o->w16c >> 4) << 12;
    xs[1] = (o->w170 >> 4) << 12;
    for (i = 0; i < 0x18; i++) {
        void *p;
        if (i >= o->n) {
            continue;
        }
        if (!(q->wd0 & (1 << i))) {
            continue;
        }
        p = q->ptrs[i];
        if (p == 0) {
            continue;
        }
        func_0201eaa0(o->h18c == 0 ? 1 : 2, p, xs, 0, 0, 0, o->h190, o->h18e, o->w7c, o->w80, o->b3 ? 1 : 0, 0);
    }
    return 1;
}
