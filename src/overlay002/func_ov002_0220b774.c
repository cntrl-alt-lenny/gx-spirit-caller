/* func_ov002_0220b774: C-39 — helper(bit0@2, 0xb, f0@0, b6_14@4) != 0. */
typedef unsigned short u16;
struct S0220b774 { u16 f0; u16 bit0:1; u16 r2:15; u16 f4lo6:6; u16 b6_14:9; u16 f4b15:1; };
extern int func_ov002_021b3fd8(int bit0, int k, u16 f0, int bits);
int func_ov002_0220b774(struct S0220b774 *self) {
    return func_ov002_021b3fd8(self->bit0, 0xb, self->f0, self->b6_14) != 0;
}
