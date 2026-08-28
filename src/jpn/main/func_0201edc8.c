struct S1ee1c {
    int f_0;
    int f_4;
    char _pad[4];
    int f_c;
};

struct OutS1ee1c {
    int f_0;
    int f_4;
};

extern void func_0209281c(int a, int b);
extern void func_0208f370(void);
extern void func_0208f2fc(int a, int b, int c);
extern void func_0208f2a4(void);
extern void func_0208fe34(int a, int b, int c);
extern void func_0208f19c(void);
extern void func_0208f128(int a, int b, int c);
extern void func_0208f0dc(void);
extern void func_0208fdcc(int a, int b, int c);
extern void func_0209002c(void);
extern void func_0208ffb8(int a, int b, int c);
extern void func_0208ff60(void);
extern void func_0207f768(struct OutS1ee1c *d, int c, int b);

void func_0201edc8(struct S1ee1c *a, int b, int c, struct OutS1ee1c *d, int e) {
    func_0209281c(a->f_c, e);
    switch (c) {
    case 1:
        if (a->f_4 != 0) {
            func_0208f370();
            func_0208f2fc(a->f_c, b, e);
            func_0208f2a4();
        } else {
            func_0208fe34(a->f_c, b, e);
        }
        break;
    case 2:
        if (a->f_4 != 0) {
            func_0208f19c();
            func_0208f128(a->f_c, b, e);
            func_0208f0dc();
        } else {
            func_0208fdcc(a->f_c, b, e);
        }
        break;
    case 0:
        func_0209002c();
        func_0208ffb8(a->f_c, b, e);
        func_0208ff60();
        break;
    }
    d->f_0 = a->f_0;
    d->f_4 = a->f_4;
    func_0207f768(d, c, b);
}
