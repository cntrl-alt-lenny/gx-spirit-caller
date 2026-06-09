#pragma thumb on
extern int func_020b3870(int a, int b);
extern void *func_ov004_021de250(int n);
extern void func_ov004_021de23c(void *p);
extern void func_ov004_021dbfd4(int a, void *b, int c, int d, int e);
extern void func_ov004_021dbfa8(void *a, void *b, int c);
extern void func_ov004_021dbf6c(void *a, int b, void *c);
int func_ov004_021dc020(void *arg0, int arg1, int arg2, int arg3) {
    void *p, *q;
    int i;
    p = func_ov004_021de250(func_020b3870(arg1, 2));
    if (p == 0) return -1;
    q = func_ov004_021de250(arg1);
    if (q == 0) {
        func_ov004_021de23c(p);
        return -1;
    }
    for (i = 0; i < 2; i++) {
        func_ov004_021dbfd4(i, p, arg1, arg2, arg3);
        func_ov004_021dbfa8(p, arg0, arg1);
        func_ov004_021dbf6c(arg0, arg1, q);
    }
    func_ov004_021de23c(p);
    func_ov004_021de23c(q);
    return 0;
}
