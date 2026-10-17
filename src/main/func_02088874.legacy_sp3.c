struct S { int active; int f4; char pad8[0x18]; int f20; int f24; int f28; int f2c; };
extern struct S data_021a524c;
extern char data_021a520c[];
extern void func_02095030(int a, int b, int c, int d);
extern int func_020955a8(void);
extern void func_02095678(int a);
extern void func_020955e8(int a);
extern int func_020924c0(void *a, int b, int c);
extern void func_0208738c(int a);
extern void func_020873cc(int a);
extern void func_02087328(int a);
extern void func_02094dd8(int a, int b, int c, int d);

void func_02088874(void)
{
    struct S *s = &data_021a524c;
    int ok;
    int mask;
    if (s->active == 0) {
        return;
    }
    ok = s->f2c >= 0;
    if (ok) {
        mask = 1 << s->f2c;
    } else {
        mask = 0;
    }
    func_02095030(s->f24, s->f28, mask, 0);
    if (ok) {
        int t = func_020955a8();
        func_02095678(1);
        func_020955e8(t);
        while (func_020924c0(data_021a520c, 0, 0) != 0) {
        }
    }
    if (s->f28 != 0) {
        func_0208738c(s->f28);
    }
    if (s->f20 != 0) {
        func_020873cc(s->f20);
    }
    if (ok) {
        func_02087328(s->f2c);
    }
    if (s->f4 == 1) {
        func_02094dd8(0, 0, 0, 0);
    }
    s->active = 0;
}
