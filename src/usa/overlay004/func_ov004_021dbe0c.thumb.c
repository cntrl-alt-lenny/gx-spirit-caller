#pragma thumb on
extern int func_020b377c(int a, int b);
extern void *func_ov004_021de03c(int n);
extern void func_ov004_021de028(void *p);
extern void func_ov004_021dbdc0(int a, void *b, int c, int d, int e);
extern void func_ov004_021dbd94(void *a, void *b, int c);
extern void func_ov004_021dbd58(void *a, int b, void *c);
int func_ov004_021dbe0c(void *arg0, int arg1, int arg2, int arg3) {
    void *p, *q;
    int i;
    p = func_ov004_021de03c(func_020b377c(arg1, 2));
    if (p == 0) return -1;
    q = func_ov004_021de03c(arg1);
    if (q == 0) {
        func_ov004_021de028(p);
        return -1;
    }
    for (i = 0; i < 2; i++) {
        func_ov004_021dbdc0(i, p, arg1, arg2, arg3);
        func_ov004_021dbd94(p, arg0, arg1);
        func_ov004_021dbd58(arg0, arg1, q);
    }
    func_ov004_021de028(p);
    func_ov004_021de028(q);
    return 0;
}
