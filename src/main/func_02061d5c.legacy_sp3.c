typedef struct Obj Obj;
typedef struct Other Other;
typedef void (*Callback)(Obj *, Other *, int, int, int, int, int);
struct Obj {
    int f0;
    char pad04[8];
    int f0c;
    int f10;
    int f14;
    int f18;
    int f1c;
    Callback f20;
};
struct Other {
    char pad00[0x24];
    int f24;
};
extern void func_02064aa0(Obj *self);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02101500[];
extern char data_021014e4[];
int func_02061d5c(Obj *self, Other *other, int a, int b, int c, int d, int e) {
    if (self == 0 || other == 0) {
        func_020a6d54((int)data_02101500, (int)data_021014e4, 0, 0x3d);
    }
    if (self == 0 || other == 0) {
        return 1;
    }
    if (self->f20 == 0) {
        return 1;
    }
    if (e == 0 || d == 0) {
        d = 0;
        e = 0;
    }
    self->f1c += 1;
    other->f24 += 1;
    self->f20(self, other, a, b, c, d, e);
    self->f1c -= 1;
    other->f24 -= 1;
    if (self->f14 != 0 && self->f1c == 0) {
        func_02064aa0(self);
        return 0;
    }
    return 1;
}
