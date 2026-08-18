extern int func_02032634(void);
extern int func_0201cd1c(int a, void *b, int c);
extern int func_02031eac(void);
extern int func_02032028(int a, int b);
extern void func_02094688(void *a, int b, int c);
extern int func_02046ac4(void);
extern void func_02034884(void);
extern int func_020320f8(int a, unsigned short b, int c, int d, int e, int f, void *g);

int func_02034888(int p0, void *p1, int p2) {
    int mode = func_02032634();

    switch (mode) {
    case 1:
        return func_0201cd1c(p0, p1, p2);
    case 2: {
        int a = func_02031eac();
        int b = func_02032028(a, p2);
        int c, d, r;

        func_02094688(p1, b, p2);

        c = func_02031eac();
        d = func_02046ac4();
        r = func_020320f8(c, p0, d, 0, p2, b, (void *)func_02034884);
        return r != -1;
    }
    }
    return 0;
}
