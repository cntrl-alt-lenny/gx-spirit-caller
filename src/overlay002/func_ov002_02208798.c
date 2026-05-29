/* func_ov002_02208798: C-39 — if b6_11 == 5 return func_021bd09c(bit0)
 * > 0; else return 1. */
typedef unsigned short u16;
struct S02208798 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_021bd09c(int bit0);
int func_ov002_02208798(struct S02208798 *self) {
    if (self->b6_11 == 5) return func_ov002_021bd09c(self->bit0) > 0;
    return 1;
}
