typedef unsigned short u16;

typedef struct {
    u16 a : 1;
    u16 b : 5;
    u16 c : 8;
    u16 d : 2;
} Bits;

typedef struct {
    u16 pad0[2];
    u16 f4;
    u16 pad1[2];
    u16 fa;
} Obj;

extern Obj *func_ov002_022a6324(void *self, int a, int b, int c);
extern void func_ov002_022a60f4(void *self, int a, int b, int c);
extern void func_02037208(int a, int b, int c, int d);

void func_ov002_022a6480(void *self, Bits *p) {
    Obj *o = func_ov002_022a6324(self, p->a, p->b, p->c);
    if (o != 0) {
        o->fa = *(u16 *)p;
        o->f4 = 8;
        func_02037208(0x35, -1, 0, 1);
    }
    func_ov002_022a60f4(self, p->a, p->b, p->c);
}
