#pragma thumb on
extern int func_020b377c(int a, int b);
extern void func_ov004_021dbc54(unsigned char *p, unsigned char *q, int n);
void func_ov004_021dbd58(unsigned char *a, int b, unsigned char *c) {
    int h = func_020b377c(b, 2);
    func_ov004_021dbc54(c, a + h, h);
    func_ov004_021dbc54(c + h, a, h);
    func_ov004_021dbc54(a, c, b);
}
