

typedef unsigned short u16;

extern int func_ov002_021dea38(int bit0, int fld5);
extern int func_ov002_021d5a90(int bit0, int a, int f0, int c);

struct F021f6704_F2 {
    u16 bit0 : 1;
    u16 fld5 : 5;
    u16 mid6 : 6;
    u16 f12  : 2;
    u16 hi2  : 2;
};
struct F021f6704 {
    u16 f0;
    struct F021f6704_F2 f2;
};

int func_ov002_021f6614(struct F021f6704 *self) {
    if (self->f2.f12 != 2)
        func_ov002_021dea38(self->f2.bit0, self->f2.fld5);
    else
        func_ov002_021d5a90(self->f2.bit0, 0xb, self->f0, 0);
    return 1;
}
