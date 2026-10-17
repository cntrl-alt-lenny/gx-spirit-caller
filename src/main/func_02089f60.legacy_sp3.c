extern int func_020890e4(int idx);
extern int func_020897fc(int e, int n, int b, int c, int d);
extern int func_0208906c(int a, int p, int n, int z);
extern void func_020928e8(int p, int n);

int func_02089f60(int a0, int a1, int a2, int a3, int a4)
{
    int n;
    int p;
    n = func_020890e4(a0);
    if (n == 0) {
        return 0;
    }
    if (a4 == 0) {
        return 0;
    }
    p = func_020897fc(a4, n + 0x20, a1, a2, a3);
    if (p == 0) {
        return 0;
    }
    if (n != func_0208906c(a0, p, n, 0)) {
        return 0;
    }
    func_020928e8(p, n);
    return p;
}
