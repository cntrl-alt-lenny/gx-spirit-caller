/* func_ov002_0220db30: C-39 — if b6_11 == 0x23 return 1; else
 * return func_021bbf50(1 - bit0) == 5. */
typedef unsigned short u16;
struct S0220dc20 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_021bbe70(int x);
int func_ov002_0220db30(struct S0220dc20 *self) {
    if (self->b6_11 == 0x23) return 1;
    return func_ov002_021bbe70(1 - self->bit0) == 5;
}
