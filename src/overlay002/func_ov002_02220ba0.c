typedef unsigned short u16;

typedef struct {
    u16 pad0;
    u16 a : 1;
    u16 b : 5;
    u16 rest : 10;
    u16 pad4;
    u16 pad6;
    u16 f8;
} Obj;

typedef struct {
    char pad[0x5a8];
    int state;
} GlobA;

typedef struct {
    char pad[0xb0];
    u16 val;
} GlobB;

extern GlobA data_ov002_022ce288;
extern GlobB data_ov002_022d0e6c;
extern void func_ov002_0226b258(int a, int b);
extern int func_ov002_02257704(Obj *self);
extern int func_ov002_021de408(Obj *self, int v);

int func_ov002_02220ba0(Obj *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_0226b258(self->a, self->b);
        return 0x7f;
    case 0x7f:
        self->f8 = data_ov002_022d0e6c.val;
        func_ov002_021de408(self, func_ov002_02257704(self));
        return 0;
    default:
        return 0;
    }
}
