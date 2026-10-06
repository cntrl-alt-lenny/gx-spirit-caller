typedef struct Obj02061578 Obj02061578;
typedef int (*Cb02061578)(Obj02061578 *self, int a, int b, int c, int d);

struct Obj02061578 {
    char       _pad_00[0x14];
    int        f14;
    char       _pad_18[0x4];
    int        f1c;
    char       _pad_20[0x10];
    Cb02061578 f30;
};

extern char data_021014dc[];
extern char data_021014e4[];
extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern void func_02064aa0(Obj02061578 *self);

int func_02061578(Obj02061578 *self, int a, int b, int c, int d, int *out) {
    *out = 0;
    if (self == 0) {
        func_020a6d54(data_021014dc, data_021014e4, 0, 0x197);
    }
    if (self == 0) {
        return 1;
    }
    if (self->f30 == 0) {
        return 1;
    }
    if (d == 0 || c == 0) {
        c = 0;
        d = 0;
    }
    self->f1c += 1;
    *out = self->f30(self, a, b, c, d);
    self->f1c -= 1;
    if (self->f14 != 0 && self->f1c == 0) {
        func_02064aa0(self);
        return 0;
    }
    return 1;
}
