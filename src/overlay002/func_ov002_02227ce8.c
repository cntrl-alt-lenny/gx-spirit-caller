struct Func02227ce8Data {
    char pad[3308];
    int f3308;
};
extern struct Func02227ce8Data data_ov002_022d016c;
extern int func_ov002_0225764c(int a, int b, int c);
extern void func_ov002_021d91e0(int a, int b, int c);

int func_ov002_02227ce8(int a) {
    int k;
    int j;
    int i;
    for (i = 0; i < 2; i++) {
        k = data_ov002_022d016c.f3308 ^ i;
        for (j = 0; j <= 10; j++) {
            if (func_ov002_0225764c(a, k, j) != 0) {
                func_ov002_021d91e0(k, j, 1);
            }
        }
    }
    return 0;
}
