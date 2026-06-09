#pragma thumb on
extern char data_ov004_022916b0[];
extern char data_ov004_02291604[];
extern int func_ov004_021dccc8(void *a, void *b);
extern unsigned func_ov004_021dbd1c(int x);
extern int func_ov004_021dbd34(int x);
extern int func_ov004_021dcbf0(void *a, void *b);
extern int func_ov004_021dc820(int x);
extern void func_ov004_021dd590(int x);
int func_ov004_021dd040(int arg0, char *arg1, int *arg2, char *arg3) {
    char *p, *rec;
    int t, r;
    if (arg0 != 0) { arg2[0]++; return arg0; }
    p = arg1 + 12;
    rec = arg1 + 36;
    if (func_ov004_021dccc8(arg3, p + 16) < 0) { arg2[0]++; return arg0; }
    if (func_ov004_021dbd1c(*(unsigned short *)(rec + 2)) == 0) { arg2[0]++; return arg0; }
    t = *(unsigned char *)rec;
    if (t == 7) {
        int *v = (int *)(rec + 4);
        if (func_ov004_021dbd34(*(int *)(rec + 4)) == ~1) func_ov004_021dd590(20);
        else if (func_ov004_021dbd34(*v) == ~2) func_ov004_021dd590(21);
        else func_ov004_021dd590(24);
        return -1;
    }
    if (t != 1) { arg2[0]++; return arg0; }
    r = func_ov004_021dcbf0(rec + 4, data_ov004_022916b0);
    if (r < 0) {
        if (r == ~1) { func_ov004_021dd590(22); return -1; }
        arg2[0]++;
        return arg0;
    }
    *(int *)data_ov004_02291604 = func_ov004_021dc820(func_ov004_021dbd1c(*(unsigned short *)(p + 12)));
    arg2[0] = 0;
    return 1;
}
