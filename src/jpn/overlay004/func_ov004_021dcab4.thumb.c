#pragma thumb on
extern char data_ov004_0220a098[];
extern int func_ov004_021dbaf4(void *p);
extern void func_ov004_021dbe0c(void *p, int n, void *q, int x);
extern int func_ov004_021dbc64(unsigned char *p0, unsigned char *p1, int n);
extern int func_ov004_021dbb08(int x);
int func_ov004_021dcab4(unsigned char *a, unsigned char *b) {
    int r = 0;
    int x = func_ov004_021dbaf4(data_ov004_0220a098);
    func_ov004_021dbe0c(b, 8, data_ov004_0220a098, x);
    if (func_ov004_021dbc64(a, b, 6) != 0)
        r = ~0;
    else if (func_ov004_021dbb08(*(unsigned short *)(a + 6)) + 1 != func_ov004_021dbb08(*(unsigned short *)(b + 6)))
        r = ~1;
    return r;
}
