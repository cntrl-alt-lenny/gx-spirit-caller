/* func_ov002_022298b8: C-39 — dispatch on fc; case 1 tails a helper
 * (arg passed through -> gotcha 7, keeps the tag temp in r2), case 2
 * feeds 1-bit0 to a helper; return 0. */
typedef unsigned short u16;
struct S022298b8 { u16 f0; u16 bit0:1; u16 rest:15; u16 _4; u16 _6; u16 _8; u16 _a; u16 fc; };
extern int func_ov002_0223163c(struct S022298b8 *self, int arg);
extern void func_ov002_021e13f4(int x, int a, int b);
int func_ov002_022298b8(struct S022298b8 *self, int arg) {
    switch (self->fc) {
    case 1:
        return func_ov002_0223163c(self, arg);
    case 2:
        func_ov002_021e13f4(1 - self->bit0, 1, 1);
        break;
    }
    return 0;
}
