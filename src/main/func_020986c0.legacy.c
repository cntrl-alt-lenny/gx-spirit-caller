extern int data_021a8320;
extern void func_0209870c(void *ctx);
extern void func_0209cb68(int ctx, int a, int b, int c, void (*cb)(void *), int d, int e);

int func_020986c0(int a0, int a1, int a2, int a3) {
    func_0209cb68(data_021a8320, a2, a1, a3, func_0209870c, a0, 1);
    return 6;
}
