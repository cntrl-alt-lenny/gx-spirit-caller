typedef struct {
    void *a, *b, *c, *d, *e, *f;
    char pad18[0xb0];
    void *g;
    char padcc[0x24];
} Res;
typedef struct { char pad[0xc]; Res * volatile res; } Owner;
typedef struct { char pad[0x100]; int enabled; } Context;
extern void func_02059d90(Owner *p);
extern int func_020453e8(int a);
extern int func_020552dc(void *self);
int func_02059e5c(Context **pp, Owner *p, Res *src) {
    Res *dst;
    if ((*pp)->enabled == 0) return 1;
    func_02059d90(p);
    p->res = (Res *)func_020453e8(0xf0);
    dst = p->res;
    if (dst != 0) {
        *dst = *src;
        p->res->a = (void *)func_020552dc(src->a);
        p->res->b = (void *)func_020552dc(src->b);
        p->res->c = (void *)func_020552dc(src->c);
        p->res->d = (void *)func_020552dc(src->d);
        p->res->e = (void *)func_020552dc(src->e);
        p->res->f = (void *)func_020552dc(src->f);
        p->res->g = (void *)func_020552dc(src->g);
    }
    return p->res != 0;
}


