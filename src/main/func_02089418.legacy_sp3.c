typedef struct Tbl {
    char pad0[8];
    unsigned int count;
} Tbl;
typedef struct Obj {
    char pad0[8];
    int f8;
    char padc[4];
    int f10;
    char pad14[4];
    int f18;
    char pad1c[4];
    int f20;
    char pad24[0xc];
    int f30;
    char pad34[0x50];
    Tbl *f84;
    char *f88;
    char *f8c;
} Obj;

extern void Copy32(char *src, Obj *dst, int n);
extern Obj *data_021a5800;

void func_02089418(Obj *p, char *base)
{
    unsigned int i;
    Copy32(base, p, 0x30);
    p->f8c = p->f18 == 0 ? 0 : base + p->f18;
    p->f84 = p->f20 == 0 ? 0 : (Tbl *)(base + p->f20);
    p->f88 = p->f10 == 0 ? 0 : base + p->f10;
    for (i = 0; i < p->f84->count; i++) {
        char *e = (char *)p->f84 + 0xc + i * 16;
        int v = *(int *)e;
        *(char **)(e + 8) = v == 0 ? 0 : base + v;
    }
    p->f30 = 0;
    data_021a5800 = p;
}
