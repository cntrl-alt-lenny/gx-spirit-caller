/* func_ov002_0221b14c: C-39 — guard on bit 2 of +4; else
 * func_021e05fc(bit0@2, (u16)f14); return 0. */
typedef unsigned short u16;
struct S0221b23c {
    u16 f0; u16 bit0:1; u16 r2:15; u16 b4lo:2; u16 bit2:1; u16 b4hi:13;
    char _6[0x14 - 6];
    int f14;
};
extern void func_ov002_021e050c(int bit0, u16 v);
int func_ov002_0221b14c(struct S0221b23c *self) {
    if (self->bit2) return 0;
    func_ov002_021e050c(self->bit0, self->f14);
    return 0;
}
