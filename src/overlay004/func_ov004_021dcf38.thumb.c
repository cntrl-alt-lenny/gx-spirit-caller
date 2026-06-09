#pragma thumb on
extern char data_ov004_02291d30[];
extern char data_ov004_022916b0[];
extern char data_ov004_02291630[];
extern int func_ov004_021dccc8(void *a, void *b);
extern unsigned func_ov004_021dbd1c(int x);
extern int func_ov004_021dbd34(int x);
extern void func_ov004_021dbe5c(void *p, int v, int n);
extern int func_ov004_021dc830(int a, void *b, int c, void *d, void *e);
extern void func_ov004_021dd590(int x);
int func_ov004_021dcf38(int arg0, char *arg1, int *arg2, char *arg3) {
    char *p, *rec;
    int t;
    if (arg0 != 1) { arg2[0]++; return arg0; }
    p = arg1 + 12;
    rec = arg1 + 36;
    if (func_ov004_021dccc8(arg3 + 8, p + 16) < 0) { arg2[0]++; return arg0; }
    if (func_ov004_021dbd1c(*(unsigned short *)(rec + 2)) == 0) { arg2[0]++; return arg0; }
    t = *(unsigned char *)rec;
    if (t == 7) {
        if (func_ov004_021dbd34(*(int *)(rec + 4)) == ~1) func_ov004_021dd590(20);
        else if (func_ov004_021dbd34(*(int *)(rec + 4)) == ~2) func_ov004_021dd590(21);
        else func_ov004_021dd590(24);
        return -1;
    }
    func_ov004_021dbe5c(data_ov004_02291d30, 0, 1696);
    if (func_ov004_021dc830(0, rec, func_ov004_021dbd1c(*(unsigned short *)(p + 10)), data_ov004_02291d30, data_ov004_022916b0) < 0) {
        arg2[0]++;
        return arg0;
    }
    if ((*(int *)(data_ov004_02291630 + 12) & *(int *)(data_ov004_02291630 + 8)) == 0)
        return arg0;
    arg2[0] = 0;
    return 2;
}
