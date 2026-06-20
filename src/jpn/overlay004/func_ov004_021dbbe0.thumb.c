#pragma thumb on
extern int func_020b377c(int a, int b);
extern void func_0206e534(void *p, int n, int lo, int hi);
typedef struct { int a, b; } Pair;
void func_ov004_021dbbe0(int arg0, void *arg1, int arg2, int arg3, int *arg4) {
    Pair local;
    long long s = 0;
    local = *(Pair *)arg1;
    s += (long long)func_020b377c(arg4[0] * 0x01FF6210, 64);
    s += (long long)func_020b377c(arg4[1] * 0x01FF6210, 64);
    func_0206e534(&local, 1, (int)s, (int)(s >> 32));
}
