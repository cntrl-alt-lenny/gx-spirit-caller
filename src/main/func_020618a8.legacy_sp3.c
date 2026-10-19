typedef struct Obj Obj;
struct Obj {
    int f0;
    char pad4[8];
    int f0c;
    int f10;
    int f14;
    char pad18[4];
    int f1c;
};
typedef struct Self Self;
typedef void (*Callback)(Self *, int, int, int, int);
struct Self {
    char pad0[8];
    Obj *f8;
    char padc[24];
    int f24;
    char pad28[112];
    char *f98;
};
extern void func_020a6d54(int a,int b,int c,int d);
extern void *func_020540d0(char *s, int index);
extern void func_02064aa0(Obj *self);
extern char data_021014f4[];
extern char data_021014e4[];
int func_020618a8(Self *self, int arg1, int arg2, int arg3, int arg4) {
    void *cb;
    if (self == 0) {
        func_020a6d54((int)data_021014f4, (int)data_021014e4, 0, 0x101);
    }
    if (self == 0) return 1;
    cb = func_020540d0(self->f98, arg1);
    if (cb == 0) return 1;
    if (arg3 == 0 || arg2 == 0) {
        arg2 = 0;
        arg3 = 0;
    }
    self->f24 += 1;
    self->f8->f1c += 1;
    (*(Callback *)cb)(self, arg1, arg2, arg3, arg4);
    self->f24 -= 1;
    self->f8->f1c -= 1;
    if (self->f8->f14 != 0 && self->f8->f1c == 0) {
        func_02064aa0(self->f8);
        return 0;
    }
    return 1;
}
