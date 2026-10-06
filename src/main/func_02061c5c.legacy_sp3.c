typedef struct {
    char _pad_14[0x14];
    int f14;
    char _pad_18[0x1c - 0x18];
    int f1c;
} SubObj02061c5c;

typedef struct Self02061c5c Self02061c5c;
typedef void (*Cb02061c5c)(Self02061c5c *, int, int, int);

struct Self02061c5c {
    char _pad_08[0x8];
    SubObj02061c5c *f8;
    char _pad_18[0x18 - 0xc];
    int f18;
    char _pad_24[0x24 - 0x1c];
    int f24;
    Cb02061c5c f28;
};

extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern void func_02064aa0(SubObj02061c5c *self);

extern char data_021014e4[];
extern char data_021014f4[];

int func_02061c5c(Self02061c5c *self, int a, int b, int c) {
    if (self == 0) {
        func_020a6d54(data_021014f4, data_021014e4, 0, 0x69);
    }
    if (self == 0) {
        return 1;
    }
    self->f18 = a;
    if (self->f28 == 0) {
        return 1;
    }
    if (c == 0 || b == 0) {
        b = 0;
        c = 0;
    }
    self->f24 += 1;
    self->f8->f1c += 1;
    self->f28(self, a, b, c);
    self->f24 -= 1;
    self->f8->f1c -= 1;
    if (self->f8->f14 != 0 && self->f8->f1c == 0) {
        func_02064aa0(self->f8);
        return 0;
    }
    return 1;
}
