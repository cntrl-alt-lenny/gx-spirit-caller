typedef unsigned short u16;
typedef unsigned int u32;

typedef struct S {
    u16 a;
    u16 b : 1;
    u16 c : 5;
    u16 pad1 : 6;
    u16 d : 2;
    u16 pad2 : 2;
    u16 e : 6;
    u16 f : 9;
    u16 g : 1;
    int w1, w2, w3, w4;
} S;

typedef struct P {
    u32 a : 13;
    u32 b : 1;
    u32 pad : 8;
    u32 c : 8;
    u32 pad2 : 2;
} P;

extern P *func_ov002_021c93f0(int a);
extern void func_ov002_021fca38(S *s);

int func_ov002_021c2850(int a, int n) {
    P *p;
    S s;
    u16 ta, tn;
    int *z;
    if (n <= 4) {
        return 0;
    }
    p = func_ov002_021c93f0(a);
    ta = a;
    tn = n;
    z = (int *)&s;
    z[0] = 0;
    s.b = ta;
    z[1] = 0;
    z[2] = 0;
    z[3] = 0;
    z[4] = 0;
    z[5] = 0;
    s.c = n;
    s.a = p->a;
    s.f = p->b + (p->c << 1);
    s.d = 0;
    func_ov002_021fca38(&s);
}
