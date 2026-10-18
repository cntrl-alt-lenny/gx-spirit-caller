typedef unsigned short u16;

typedef struct {
    u16 a;
    u16 b : 1;
    u16 c : 5;
    u16 pad : 10;
} Obj;

typedef struct {
    char pad[0x5a8];
    int state;
} State;

typedef struct {
    char pad[0xd44];
    int v;
} Buf;

extern State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern Buf data_ov002_022d016c;
extern struct { char pad[0xb2]; u16 f; } data_ov002_022d0e6c;
extern int func_ov002_021b00d0(int a);
extern int func_ov002_021ae664(int a);
extern void func_ov002_021df818(Obj *o, int b, int c);
extern void func_ov002_0226b22c(int a, int b, int c, int d);

int func_ov002_02230f10(Obj *o)
{
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (data_ov002_022cd744[o->b] == 1) {
            data_ov002_022d016c.v = func_ov002_021b00d0(2);
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    case 0x7f:
        func_ov002_0226b22c(o->b, o->c, 1, data_ov002_022d016c.v);
        return 0x7e;
    case 0x7e:
        if (data_ov002_022d0e6c.f != 0) {
            func_ov002_021df818(o, 1 - o->b, 0x3e8);
        } else {
            func_ov002_021df818(o, o->b, 0x3e8);
        }
        return 0;
    }
    return 0;
}
