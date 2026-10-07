typedef unsigned char u8;
typedef unsigned short u16;

struct R { char pad0[4]; u16 f4; char pad6[2]; u8 f8; u8 f9; };

extern struct R *func_0208938c(int a);
extern int func_0208a344(void *o, int a1, int a2, int a3, struct R *r, int a5);

int func_0208a574(void *o, int a1, int a2, int a3, int a4)
{
    struct R *r = func_0208938c(a4);
    if (r == 0) {
        return 0;
    }
    if (a3 < 0) {
        a3 = r->f8;
    }
    if (a2 < 0) {
        a2 = r->f4;
    }
    if (a1 < 0) {
        a1 = r->f9;
    }
    return func_0208a344(o, a1, a2, a3, r, a4);
}
