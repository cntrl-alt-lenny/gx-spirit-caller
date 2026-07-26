typedef unsigned short u16;

struct F02223fe4_Self {
    u16 f0; u16 bit0 : 1; u16 rest : 15;
    u16 _4; u16 _6; u16 _8; u16 _a; u16 fc;
};

extern void func_ov002_0226af38(int x, int a, int b);
extern void func_ov002_021e13f4(int x, int a, int b);

int func_ov002_02223fe4(struct F02223fe4_Self *self) {
    switch (self->fc) {
    case 1:
        func_ov002_0226af38(1 - self->bit0, 1, 1);
        break;
    case 2:
        func_ov002_021e13f4(1 - self->bit0, 2, 1);
        break;
    }
    return 0;
}
