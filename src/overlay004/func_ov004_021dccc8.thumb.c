#pragma thumb on
extern char data_ov004_0220a2f8[];
extern int func_ov004_021dbd08(void *p);
extern void func_ov004_021dc020(void *p, int n, void *q, int x);
extern int func_ov004_021dbe78(unsigned char *p0, unsigned char *p1, int n);
extern int func_ov004_021dbd1c(int x);
int func_ov004_021dccc8(unsigned char *a, unsigned char *b) {
    int r = 0;
    int x = func_ov004_021dbd08(data_ov004_0220a2f8);
    func_ov004_021dc020(b, 8, data_ov004_0220a2f8, x);
    if (func_ov004_021dbe78(a, b, 6) != 0)
        r = ~0;
    else if (func_ov004_021dbd1c(*(unsigned short *)(a + 6)) + 1 != func_ov004_021dbd1c(*(unsigned short *)(b + 6)))
        r = ~1;
    return r;
}
