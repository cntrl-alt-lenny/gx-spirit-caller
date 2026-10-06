typedef struct {
    char _pad_14[0x14];
    int f14;
    char _pad_18[0x1c - 0x18];
    int f1c;
} SubObj02061b60;

typedef struct Self02061b60 Self02061b60;
typedef void (*Cb02061b60)(Self02061b60 *, int, int, int);

struct Self02061b60 {
    char _pad_08[0x8];
    SubObj02061b60 *f8;
    char _pad_24[0x24 - 0xc];
    int f24;
    char _pad_2c[0x2c - 0x28];
    Cb02061b60 f2c;
};

extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern void func_02064aa0(SubObj02061b60 *self);

extern char data_021014e4[];
extern char data_021014f4[];

int func_02061b60(Self02061b60 *self, int a, int b, int c) {
    if (self == 0) {
        func_020a6d54(data_021014f4, data_021014e4, 0, 0x94);
    }
    if (self == 0) {
        return 1;
    }
    if (self->f2c == 0) {
        return 1;
    }
    if (b == 0 || a == 0) {
        a = 0;
        b = 0;
    }
    self->f24 += 1;
    self->f8->f1c += 1;
    self->f2c(self, a, b, c);
    self->f24 -= 1;
    self->f8->f1c -= 1;
    if (self->f8->f14 != 0 && self->f8->f1c == 0) {
        func_02064aa0(self->f8);
        return 0;
    }
    return 1;
}
