#pragma thumb on
extern void func_0206ec58(int a, int b, int c, int d, void *e);
void func_ov004_021dbbc8(int a, int b, int c, int d, unsigned char *e, int f) {
    *e = f;
    func_0206ec58(a, b, c, d, e);
}
