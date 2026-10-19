extern void func_02094688(void *src, void *dst, int n);
extern void func_020945f4(void *dst, int val, int n);
extern void func_02079838(unsigned short *dst, unsigned short *src, int n);
extern void func_02079a08(void *arg0, unsigned short *arg1, unsigned short *arg2, int arg3);
extern void func_02079d30(unsigned short *out, unsigned short *a, unsigned short *b, int capacity);
extern int func_02079b0c(unsigned short *a, unsigned short *b, int n);
extern void func_02079bbc(unsigned short *out, unsigned short *a, unsigned short *b, int capacity);
extern signed char *func_020a7388(signed char *dst, signed char *src, int n);

void func_020791e8(unsigned short *a, unsigned short *b, unsigned short *c, int n, int k, unsigned short *d, unsigned short *e, unsigned short *f, unsigned short *g)
{
    int bytes;
    int rest;
    func_02094688(a, b, n * 2);
    if (c == (unsigned short *)1) {
        func_02079838(a, b, n);
    } else if (c != 0) {
        func_02079a08(a, b, c, n);
    }
    func_02079a08(f, a, e, k);
    rest = (n - k) * 2;
    func_020945f4(f + k, 0, rest);
    func_02079a08(g, f, d, n);
    func_02079d30(a, a, g, n);
    func_020a7388((signed char *)a, (signed char *)(a + k), rest);
    func_020945f4(a + n - k, 0, k * 2);
    switch (func_02079b0c(a, d, n)) {
    case 0:
        func_020945f4(a, 0, n * 2);
        break;
    case 1:
        func_02079bbc(a, a, d, n);
        break;
    }
}

