typedef unsigned short u16;
struct S0220919c { u16 f0; u16 bit0:1; u16 idx:5; u16 rest:10; };
extern int func_ov002_021bbf50(int a);
extern int func_ov002_021bc618(int a);
extern int func_ov002_021c23ac(int a, int b);
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca3f0(int a, int b);
int func_ov002_0220919c(struct S0220919c *self) {
    if (!func_ov002_021c23ac(self->bit0, self->idx)) return 0;
    if (!func_ov002_021ca2b8(self->bit0)) return 0;
    if (!func_ov002_021ca3f0(self->bit0, 0x1815)) return 0;
    if (func_ov002_021bbf50(1 - self->bit0)) {
        int a = func_ov002_021bbf50(1 - self->bit0);
        int b = func_ov002_021bc618(self->bit0);
        return a <= b + 1;
    }
    return 0;
}
