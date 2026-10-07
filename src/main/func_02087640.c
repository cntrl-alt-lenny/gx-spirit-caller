struct Ent { char pad0[0xc]; int list[6]; };
struct Link { int pad0; int pad4; int f8; };
struct Obj { int f0; int f4; int *f8; struct Link *fc; int f10; };

extern struct Ent data_021a4cb4[];
extern int func_02089920(int *p);
extern void func_0207cff4(int *list, struct Obj *o);

void func_02087640(struct Obj *o)
{
    struct Link *l;
    if (o->f8 == 0) {
        return;
    }
    func_02089920(o->f8);
    l = o->fc;
    if (l != 0) {
        l->f8 = 0;
        return;
    }
    func_0207cff4(data_021a4cb4[o->f10].list, o);
}
