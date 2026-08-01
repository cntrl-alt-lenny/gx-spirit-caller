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

extern void func_02092904(int a, int b);
extern void func_0208f458(void);
extern void func_0208f3e4(int a, int b, int c);
extern void func_0208f38c(void);
extern void func_0208ff1c(int a, int b, int c);
extern void func_0208f284(void);
extern void func_0208f210(int a, int b, int c);
extern void func_0208f1c4(void);
extern void func_0208feb4(int a, int b, int c);
extern void func_02090114(void);
extern void func_020900a0(int a, int b, int c);
extern void func_02090048(void);
extern void func_0207f850(struct OutS1ee1c *d, int c, int b);

void func_0201ee1c(struct S1ee1c *a, int b, int c, struct OutS1ee1c *d, int e) {
    func_02092904(a->f_c, e);
    switch (c) {
    case 1:
        if (a->f_4 != 0) {
            func_0208f458();
            func_0208f3e4(a->f_c, b, e);
            func_0208f38c();
        } else {
            func_0208ff1c(a->f_c, b, e);
        }
        break;
    case 2:
        if (a->f_4 != 0) {
            func_0208f284();
            func_0208f210(a->f_c, b, e);
            func_0208f1c4();
        } else {
            func_0208feb4(a->f_c, b, e);
        }
        break;
    case 0:
        func_02090114();
        func_020900a0(a->f_c, b, e);
        func_02090048();
        break;
    }
    d->f_0 = a->f_0;
    d->f_4 = a->f_4;
    func_0207f850(d, c, b);
}
