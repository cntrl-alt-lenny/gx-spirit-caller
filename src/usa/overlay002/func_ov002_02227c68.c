/* func_ov002_02227c68: C-39 — dispatch on fc; case 2 feeds 1-bit0 to a
 * helper; return 0. */
typedef unsigned short u16;
struct S02227d58 { u16 f0; u16 bit0:1; u16 rest:15; u16 _4; u16 _6; u16 _8; u16 _a; u16 fc; };
extern void func_ov002_0220e428(struct S02227d58 *self);
extern void func_ov002_021e1304(int x, int a, int b);
int func_ov002_02227c68(struct S02227d58 *self) {
    switch (self->fc) {
    case 1:
        func_ov002_0220e428(self);
        break;
    case 2:
        func_ov002_021e1304(1 - self->bit0, 2, 1);
        break;
    }
    return 0;
}
