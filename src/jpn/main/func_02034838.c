extern int func_020325e0(void);
extern int func_0201ccc8(int a, void *b, int c);
extern int func_02031e58(void);
extern int func_02031fd4(int a, int b);
extern void func_02094688(void *a, int b, int c);
extern int func_02046a58(void);
extern void func_02034834(void);
extern int func_020320a4(int a, unsigned short b, int c, int d, int e, int f, void *g);

int func_02034838(int p0, void *p1, int p2) {
    int mode = func_020325e0();

    switch (mode) {
    case 1:
        return func_0201ccc8(p0, p1, p2);
    case 2: {
        int a = func_02031e58();
        int b = func_02031fd4(a, p2);
        int c, d, r;

        func_02094688(p1, b, p2);

        c = func_02031e58();
        d = func_02046a58();
        r = func_020320a4(c, p0, d, 0, p2, b, (void *)func_02034834);
        return r != -1;
    }
    }
    return 0;
}
