/* func_ov002_02206f20: C-39 — 5-arg helper (stack arg 1) gated, then
 * tail helper2(self, arg). */
typedef unsigned short u16;
struct S010 { u16 f0; u16 bit0:1; u16 rest:15; u16 f4lo6:6; u16 b6_14:9; u16 f4b15:1; };
extern int func_ov002_021ff05c(int bit0, int a, int bits, int c, int d);
extern int func_ov002_021ff230(struct S010 *self, int arg);
int func_ov002_02206f20(struct S010 *self, int arg) {
    if (func_ov002_021ff05c(self->bit0, 1, self->b6_14, 0, 1) == 0) return 0;
    return func_ov002_021ff230(self, arg);
}
