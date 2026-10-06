typedef struct Obj02061e88 Obj02061e88;
typedef void (*Cb02061e88)(Obj02061e88 *self);

struct Obj02061e88 {
    char       _pad_00[0x14];
    int        f14;
    char       _pad_18[0x4];
    int        f1c;
    char       _pad_20[0x4];
    Cb02061e88 f24;
};

extern char data_021014dc[];
extern char data_021014e4[];
extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern void func_02064aa0(Obj02061e88 *self);

int func_02061e88(Obj02061e88 *self) {
    if (self == 0) {
        func_020a6d54(data_021014dc, data_021014e4, 0, 0x1b);
    }
    if (self == 0) {
        return 1;
    }
    if (self->f24 == 0) {
        return 1;
    }
    self->f1c += 1;
    self->f24(self);
    self->f1c -= 1;
    if (self->f14 != 0 && self->f1c == 0) {
        func_02064aa0(self);
        return 0;
    }
    return 1;
}
