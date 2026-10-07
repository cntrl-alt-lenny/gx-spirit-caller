extern char *data_02102c7c[];
extern void func_02003d98(int *a0, int a1, int a2, int a3, int a4, int a5);
extern int func_020038c0(int a, int b);
extern void func_020028b8(int a, int b, int c, int d, int e, int f, int g, int h);

void func_02003e98(int *a0, int a1, int a2, int a3, int a4, int a5) {
    if (a1 < 0x80) {
        func_02003d98(a0, a1, a2, a3, a4, a5);
    } else {
        func_020028b8(func_020038c0(a1, a5), a3, a4, a5, (int)data_02102c7c[2], *a0, a2, a5 / 2);
    }
}
