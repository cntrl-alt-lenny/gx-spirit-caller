struct S { int pad0; char **f4; int f8; int fc; };

extern int func_0207ff84(char **a, int b, int c);
extern void func_020816f4(struct S *a0, int a1, int a2, int a3, int a4, int flags, int x0);

void func_02081598(struct S *a0, int a1, int a2, int a3, int a4, int a5, int flags, int x0)
{
    if (flags & 0x100) {
        a2 += a4 - func_0207ff84(a0->f4, a0->fc, x0);
    } else if (flags & 0x80) {
        int t = func_0207ff84(a0->f4, a0->fc, x0);
        a2 += (a4 + 1) / 2 - (t + 1) / 2;
    }
    func_020816f4(a0, a1, a2, a3, a5, flags, x0);
}
