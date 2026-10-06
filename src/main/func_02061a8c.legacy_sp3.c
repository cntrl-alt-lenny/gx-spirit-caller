typedef struct {
    char _pad_14[0x14];
    int f14;
    char _pad_18[0x1c - 0x18];
    int f1c;
} SubObj02061a8c;

typedef struct Self02061a8c Self02061a8c;
typedef void (*Cb02061a8c)(Self02061a8c *, int);

struct Self02061a8c {
    char _pad_08[0x8];
    SubObj02061a8c *f8;
    char _pad_24[0x24 - 0xc];
    int f24;
    char _pad_30[0x30 - 0x28];
    Cb02061a8c f30;
};

extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern void func_02064aa0(SubObj02061a8c *self);

extern char data_021014e4[];
extern char data_021014f4[];

int func_02061a8c(Self02061a8c *self, int arg1) {
    if (self == 0) {
        func_020a6d54(data_021014f4, data_021014e4, 0, 0xba);
    }
    if (self == 0) {
        return 1;
    }
    if (self->f30 == 0) {
        return 1;
    }
    self->f24 += 1;
    self->f8->f1c += 1;
    self->f30(self, arg1);
    self->f24 -= 1;
    self->f8->f1c -= 1;
    if (self->f8->f14 != 0 && self->f8->f1c == 0) {
        func_02064aa0(self->f8);
        return 0;
    }
    return 1;
}
