typedef unsigned char u8;

struct R { char pad0[6]; u8 f6; u8 f7; };
struct H { char pad0[0x18]; int f18; };

extern void *func_02087a08(void *list, int idx, int id);
extern void *func_020878c4(int idx, void *n);
extern int func_0208a09c(void *a, int b, void *c, int d, int *out);
extern int func_0208a1e4(int a, int b, void *c, int d, struct H **out);
extern void func_020879fc(void *n);
extern void func_020879a4(void *n, void *p, int a, int b);
extern void func_02087e90(void *o, int v);
extern void func_02087e2c(void *o, int v);
extern void func_02087d10(void *o, int v);

int func_0208a344(void *o, int idx, void *a2, int id, struct R *r, int a5)
{
    struct H *h;
    int sp8;
    void *n = func_02087a08(o, idx, id);
    void *q;
    if (n == 0) {
        return 0;
    }
    q = func_020878c4(idx, n);
    if (func_0208a09c(a2, 6, q, 0, &sp8) != 0) {
        func_020879fc(n);
        return 0;
    }
    if (func_0208a1e4(a5, 1, q, 0, &h) != 0) {
        func_020879fc(n);
        return 0;
    }
    func_020879a4(n, (char *)h + h->f18, 0, sp8);
    func_02087e90(o, r->f6);
    func_02087e2c(o, r->f7);
    func_02087d10(o, a5);
    return 1;
}
