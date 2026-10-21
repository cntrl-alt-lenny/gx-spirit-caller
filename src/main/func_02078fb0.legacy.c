extern void *(*data_0219eee0)(int);
extern void (*data_0219ef0c)(void *);
extern void func_020945f4(void *dst, int val, int n);
extern int func_02079e20(short *arr, int n);
extern void func_0207932c(unsigned short *out, unsigned short *a, unsigned short *b, int n, unsigned short *work);
extern void func_02079a08(void *arg0, unsigned short *arg1, unsigned short *arg2, int arg3);
extern void func_02079b48(unsigned short *out, unsigned short *in, unsigned int borrow, int count);
extern void func_02079640(unsigned short *q, unsigned short *a, unsigned short *b, unsigned short *r, int n, unsigned short *work);
extern void func_020791e8(unsigned short *a, unsigned short *b, unsigned short *c, int n, int k, unsigned short *d, unsigned short *e, unsigned short *f, unsigned short *g);

void func_02078fb0(unsigned short *out, unsigned short *a, unsigned short *exponent, int n, unsigned short *mod)
{
    int k, i;
    unsigned short *p0, *p2, *p5, *p1, *p3, *p4, *p6;
    unsigned int limit;
    p0 = data_0219eee0(n * 22);
    if (p0 == 0) return;
    func_020945f4(p0, 0, n * 22);
    p1 = p0 + n;
    p2 = p1 + n;
    p3 = p2 + n;
    p4 = p3 + n;
    p5 = p4 + n;
    p6 = p5 + n;
    k = func_02079e20((short *)mod, n);
    p0[k] = 1;
    func_0207932c(p1, p0, mod, n, p2);
    func_02079a08(p3, p0, p1, n);
    func_02079b48(p1, p3, 1, n);
    func_02079640(p1, p1, mod, 0, n, p6);
    func_02079a08(p2, a, p0, n);
    func_02079640(0, p2, mod, p2, n, p6);
    func_02079640(0, p0, mod, out, n, p6);
    i = 0;
    limit = k << 4;
    for (; (unsigned int)i < limit; i++) {
        func_020791e8(out, p5, (unsigned short *)1, n, k, mod, p1, p3, p4);
        if ((0x8000U >> (i & 15)) & exponent[k - (i >> 4) - 1]) {
            func_020791e8(out, p5, p2, n, k, mod, p1, p3, p4);
        }
    }
    func_020791e8(out, p5, 0, n, k, mod, p1, p3, p4);
    data_0219ef0c(p0);
}




