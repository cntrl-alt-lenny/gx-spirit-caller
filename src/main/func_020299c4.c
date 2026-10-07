typedef struct {
    char pad0[8];
    void *ptrs[24];
    char pad68[8];
    unsigned short h70[24];
    unsigned short ha0[24];
    unsigned int wd0;
} Q;

typedef struct {
    char pad0[0x79];
    unsigned char n;
    char pad7a[0x98 - 0x7a];
    Q q;
} Obj;

extern void func_0207fd28(void *v, int x);
extern int func_0201e7e4(void *v);
extern void func_0201e800(void *v, int x);
extern void func_0201e7ec(void *v, int x);
extern int func_0201e80c(void *v);

int func_020299c4(Obj *o) {
    void *v;
    Q *q;
    unsigned short b;
    unsigned short a;
    int i;
    q = &o->q;
    for (i = 0; i < 0x18; i++) {
        if (i >= o->n) {
            continue;
        }
        if (!(q->wd0 & (1 << i))) {
            continue;
        }
        v = q->ptrs[i];
        a = q->h70[i];
        b = q->ha0[i];
        if (v == 0) {
            continue;
        }
        if (a != 0) {
            continue;
        }
        func_0207fd28(v, 0x1000);
        if (func_0201e7e4(v) != 0) {
            continue;
        }
        if (b & 1) {
            func_0201e800(v, 0);
            func_0201e7ec(v, 1);
        } else {
            func_0201e800(v, (unsigned short)(func_0201e80c(v) - 1));
        }
    }
    return 1;
}
