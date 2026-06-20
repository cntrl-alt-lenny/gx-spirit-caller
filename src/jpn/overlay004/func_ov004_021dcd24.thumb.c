#pragma thumb on
extern char data_ov004_02291ad0[];
extern char data_ov004_02291450[];
extern char data_ov004_022913d0[];
extern int func_ov004_021dcab4(void *a, void *b);
extern unsigned func_ov004_021dbb08(int x);
extern int func_ov004_021dbb20(int x);
extern void func_ov004_021dbc48(void *p, int v, int n);
extern int func_ov004_021dc61c(int a, void *b, int c, void *d, void *e);
extern void func_ov004_021dd37c(int x);
int func_ov004_021dcd24(int arg0, char *arg1, int *arg2, char *arg3) {
    char *p, *rec;
    int t;
    if (arg0 != 1) { arg2[0]++; return arg0; }
    p = arg1 + 12;
    rec = arg1 + 36;
    if (func_ov004_021dcab4(arg3 + 8, p + 16) < 0) { arg2[0]++; return arg0; }
    if (func_ov004_021dbb08(*(unsigned short *)(rec + 2)) == 0) { arg2[0]++; return arg0; }
    t = *(unsigned char *)rec;
    if (t == 7) {
        if (func_ov004_021dbb20(*(int *)(rec + 4)) == ~1) func_ov004_021dd37c(20);
        else if (func_ov004_021dbb20(*(int *)(rec + 4)) == ~2) func_ov004_021dd37c(21);
        else func_ov004_021dd37c(24);
        return -1;
    }
    func_ov004_021dbc48(data_ov004_02291ad0, 0, 1696);
    if (func_ov004_021dc61c(0, rec, func_ov004_021dbb08(*(unsigned short *)(p + 10)), data_ov004_02291ad0, data_ov004_02291450) < 0) {
        arg2[0]++;
        return arg0;
    }
    if ((*(int *)(data_ov004_022913d0 + 12) & *(int *)(data_ov004_022913d0 + 8)) == 0)
        return arg0;
    arg2[0] = 0;
    return 2;
}
