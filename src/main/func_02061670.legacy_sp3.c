typedef struct Obj Obj;
typedef void (*Callback)(Obj *, Obj *, int, int, int, int, int);
struct Obj {
    int f0;
    char pad4[8];
    int f0c;
    int f10;
    int f14;
    int f18;
    int f1c;
    int f20;
    int f24;
    Callback f28;
    Callback f2c;
};
extern void func_02064aa0(Obj *self);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_021014dc[];
extern char data_021014e4[];
int func_02061670(Obj *self, Obj *other, int a, int b, int c, int d, int e, int mode) {
    Callback callback;
    if (self == 0) {
        func_020a6d54((int)data_021014dc, (int)data_021014e4, 0, 0x160);
    }
    if (self == 0) return 1;
    callback = mode ? self->f28 : self->f2c;
    if (callback == 0) return 1;
    if (e == 0 || d == 0) {
        d = 0;
        e = 0;
    }
    self->f1c++;
    if (other) other->f24++;
    callback(self, other, a, b, c, d, e);
    self->f1c--;
    if (other) other->f24--;
    if (self->f14 && self->f1c == 0) {
        func_02064aa0(self);
        return 0;
    }
    return 1;
}
