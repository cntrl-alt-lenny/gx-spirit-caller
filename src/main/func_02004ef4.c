extern int data_02102c7c[];
extern void func_02003f70(int a, int b, int c, int d, int e, int f, int g);
extern void func_020048c0(int a, int b, int c, int d, int e, int f, int g);

void func_02004ef4(int a0, int a1, int a2, int a3, int a4, int a5, int a6) {
    if (data_02102c7c[0] != 0) {
        func_02003f70(a0, a1, a2, a3, a4, a5, a6);
    } else {
        func_020048c0(a0, a1, a2, a3, a4, a5, a6);
    }
}
