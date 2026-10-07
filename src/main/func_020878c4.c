struct Ent { char pad0[0xc]; int list[6]; };
struct Q { int f0; int f4; struct Q *f8; struct Q *fc; };

extern struct Ent data_021a4cb4[];
extern struct Q *func_0207cfdc(int *list, int prev);
extern void func_0207cff4(int *list, struct Q *n);
extern void func_02089864(struct Q *p);

struct Q *func_020878c4(int idx, struct Q *o)
{
    struct Ent *e = &data_021a4cb4[idx];
    struct Q *n = func_0207cfdc(e->list, 0);
    if (n == 0) {
        return 0;
    }
    func_0207cff4(e->list, n);
    n->fc = o;
    o->f8 = n;
    func_02089864(n->f8);
    return n->f8;
}
