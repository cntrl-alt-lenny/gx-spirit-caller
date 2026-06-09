#pragma thumb on
extern int func_020b3870(int a, int b);
extern void func_ov004_021dbe68(unsigned char *p, unsigned char *q, int n);
void func_ov004_021dbf6c(unsigned char *a, int b, unsigned char *c) {
    int h = func_020b3870(b, 2);
    func_ov004_021dbe68(c, a + h, h);
    func_ov004_021dbe68(c + h, a, h);
    func_ov004_021dbe68(a, c, b);
}
