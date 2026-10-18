typedef unsigned short u16;

typedef struct {
    u16 a : 1;
    u16 b : 5;
    u16 c : 8;
    u16 d : 1;
    u16 e : 1;
} Bits;

typedef struct {
    char pad0[0x578];
    int f578;
    char pad1[0x590 - 0x57c];
    u16 f590;
} Obj;

extern void func_ov002_0229a414(int a);

void func_ov002_022a6c34(Obj *o, int a, int b, int c) {
    Bits s;
    s.a = a;
    s.b = b;
    s.c = c;
    s.d = 1;
    s.e = 0;
    o->f590 = *(u16 *)&s;
    o->f578 = 0x60;
    func_ov002_0229a414(1);
}
