typedef unsigned char u8;

struct R { int f0; char pad4[2]; u8 f6; u8 f7; };
struct H { char pad0[0x18]; int f18; };

extern void *func_02087a08(void *list, int idx, int id);
extern void *func_020878c4(int idx, void *n);
extern int func_0208a09c(void *a, int b, void *c, int d, int *out);
extern void func_020879fc(void *n);
extern void func_020879a4(void *n, void *p, int a, int b);
extern void func_02087e90(void *o, int v);
extern void func_02087e2c(void *o, int v);
extern void func_02087ce8(void *o, int a, int b);

int func_0208a280(void *o, int idx, void *a2, int id, struct R *r, struct H *h, int a6, int a7)
{
    int sp4;
    void *n = func_02087a08(o, idx, id);
    if (n == 0) {
        return 0;
    }
    if (func_0208a09c(a2, 6, func_020878c4(idx, n), 0, &sp4) != 0) {
        func_020879fc(n);
        return 0;
    }
    func_020879a4(n, (char *)h + h->f18, r->f0, sp4);
    func_02087e90(o, r->f6);
    func_02087e2c(o, r->f7);
    func_02087ce8(o, a6, a7);
    return 1;
}
