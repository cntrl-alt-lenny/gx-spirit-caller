struct S { int pad0; int f4; int f8; int fc; };
struct Size { int w; int h; };

extern void func_0207feec(struct Size *out, int a, int b, int c, int d);
extern void func_020816f4(struct S *a0, int a1, int a2, int a3, int a4, int flags, int x0);

void func_02081648(struct S *a0, int x, int y, int a3, int flags, int a5)
{
    struct Size sz;
    func_0207feec(&sz, a0->f4, a0->f8, a0->fc, a5);
    if (flags & 0x10) {
        x -= (sz.w + 1) / 2;
    } else if (flags & 0x20) {
        x -= sz.w;
    }
    if (flags & 2) {
        y -= (sz.h + 1) / 2;
    } else if (flags & 4) {
        y -= sz.h;
    }
    func_020816f4(a0, x, y, sz.w, a3, flags, a5);
}
