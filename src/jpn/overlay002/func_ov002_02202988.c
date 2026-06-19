/* func_ov002_02202988: C-39 — unless b6_11==0x23, require 5-arg helper
 * != 0; return 1 (inverted polarity, shared return 1). */
typedef unsigned short u16;
struct S2a78 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4;
               u16 f4lo6:6; u16 b6_14:9; u16 f4b15:1; };
extern int func_ov002_021ff080(int bit0, int a, int bits, int c, int d);
int func_ov002_02202988(struct S2a78 *self) {
    if (self->b6_11 != 0x23) {
        if (func_ov002_021ff080(self->bit0, 1, self->b6_14, 1, 0) == 0) return 0;
    }
    return 1;
}
