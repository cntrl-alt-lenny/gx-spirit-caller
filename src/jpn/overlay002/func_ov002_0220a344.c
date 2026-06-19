/* func_ov002_0220a344: C-39 — guard on bits 18-19 of the int at +0x14,
 * then helper1(bit0) <= 1, then tail helper2(self, arg). */
typedef unsigned short u16;
struct S0220a434 {
    u16 f0; u16 bit0:1; u16 rest:15;
    char _4[0x14 - 4];
    unsigned int lo18:18; unsigned int b18_19:2; unsigned int hi12:12;
};
extern int func_ov002_021bbe70(int bit0);
extern int func_ov002_021ffff4(struct S0220a434 *self, int arg);
int func_ov002_0220a344(struct S0220a434 *self, int arg) {
    if (self->b18_19 != 0) return 0;
    if (func_ov002_021bbe70(self->bit0) > 1) return 0;
    return func_ov002_021ffff4(self, arg);
}
