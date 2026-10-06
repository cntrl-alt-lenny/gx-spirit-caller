extern char data_02101280[];
extern char data_02101294[];
extern char data_021012cc[];
extern char data_021012e4[];
extern int func_02055030(int, int, int *, int *);
extern void func_020604a4(int a, ...);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern void func_020585d4(void *a0, int a1, int a2);

int func_020601d0(int *ctx, int arg, int *status) {
    int a = 0;
    int b = 0;
    int r;

    r = func_02055030(arg, 0, &a, &b);
    if (r == -1) {
        func_020604a4((int)ctx, data_02101280);
        func_0205ffd4(ctx, 5, (int)data_02101294);
        func_020585d4(ctx, 3, 1);
        return 3;
    }
    if (r > 0) {
        if (b != 0) {
            func_020604a4((int)ctx, data_021012cc);
            *status = 4;
            return 0;
        }
        if (a != 0) {
            func_020604a4((int)ctx, data_021012e4);
            *status = 3;
            return 0;
        }
    }
    *status = 0;
    return 0;
}
