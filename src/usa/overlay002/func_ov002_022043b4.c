/* func_ov002_022043b4: C-39 — if b6_11 == 0x23 return 1; else
 * return func_021bbc58(bit0, 1) > 0. */
typedef unsigned short u16;
struct S022044a4 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_021bbb78(int bit0, int k);
int func_ov002_022043b4(struct S022044a4 *self) {
    if (self->b6_11 == 0x23) return 1;
    return func_ov002_021bbb78(self->bit0, 1) > 0;
}
