extern void func_020037d0(int *a0, int a1, int a2, int a3, int a4, int a5);
extern int func_020038c0(int a, int b);
extern void func_02001f18(int a, int b, int c, int d, int e, int f, int g);

void func_02003a4c(int *a0, int a1, int a2, int a3, int a4, int a5) {
    if (a1 < 0x80) {
        func_020037d0(a0, a1, a2, a3, a4, a5);
    } else {
        func_02001f18(func_020038c0(a1, a5), a3, a4, a5, *a0, a2, a5 / 2);
    }
}
