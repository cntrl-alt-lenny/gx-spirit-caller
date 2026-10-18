typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
struct G { char pad[0x5a8]; int mode; };
extern struct G data_ov002_022ce288;
extern int func_ov002_022577dc();
extern void func_ov002_021df818(struct S *self, int a, int b);
extern int func_ov002_0220e75c(struct S *self, int p1);
int func_ov002_02231fa4(struct S *self, int p1) {
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        func_ov002_021df818(self, 1 - self->bit0, func_ov002_022577dc() * 1000);
        return 0x7f;
    case 0x7f:
        return func_ov002_0220e75c(self, p1);
    }
    return 0;
}
