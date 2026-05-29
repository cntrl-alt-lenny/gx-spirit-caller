/* func_ov002_02288904: C-39 — if b6_11 != 3 return 0; else return
 * helper(1-bit0, 1, 0) > 0. */
typedef unsigned short u16;
struct S02288904 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_021bc16c(int x, int a, int b);
int func_ov002_02288904(struct S02288904 *self) {
    if (self->b6_11 != 3) return 0;
    return func_ov002_021bc16c(1 - self->bit0, 1, 0) > 0;
}
