typedef struct {
    char _pad0[0x8];
    int x8;
    int xc;
} Sub;

typedef struct {
    char _pad0[0x8];
    Sub *x8;
    int xc;
    int x10;
    int x14;
    int x18;
} Entry;

typedef struct {
    char _pad0[0x104];
    int x104;
} Owner;

extern int func_020453b4(int a);
extern int func_0205d674(int **p, Entry *e);

int func_0205888c(Owner **pp, Entry *e) {
    Owner *o = *pp;

    if (e->x8 != 0 && o->x104 == 0) {
        func_020453b4(e->x8->x8);
        e->x8->x8 = 0;
        func_020453b4(e->x8->xc);
        e->x8->xc = 0;
        func_020453b4((int)e->x8);
        e->x8 = 0;
    }
    func_020453b4(e->x10);
    e->x10 = 0;
    func_020453b4(e->x18);
    e->x18 = 0;
    e->x14 = 0;
    if (e->xc == 0 || (o->x104 == 1 && e->x8 == 0)) {
        func_0205d674((int **)pp, e);
        return 0;
    }
    return 1;
}
