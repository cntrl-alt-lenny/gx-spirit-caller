#pragma thumb on
extern char data_ov004_02291450[];
extern char data_ov004_022913a4[];
extern int func_ov004_021dcab4(void *a, void *b);
extern unsigned func_ov004_021dbb08(int x);
extern int func_ov004_021dbb20(int x);
extern int func_ov004_021dc9dc(void *a, void *b);
extern int func_ov004_021dc60c(int x);
extern void func_ov004_021dd37c(int x);
int func_ov004_021dce2c(int arg0, char *arg1, int *arg2, char *arg3) {
    char *p, *rec;
    int t, r;
    if (arg0 != 0) { arg2[0]++; return arg0; }
    p = arg1 + 12;
    rec = arg1 + 36;
    if (func_ov004_021dcab4(arg3, p + 16) < 0) { arg2[0]++; return arg0; }
    if (func_ov004_021dbb08(*(unsigned short *)(rec + 2)) == 0) { arg2[0]++; return arg0; }
    t = *(unsigned char *)rec;
    if (t == 7) {
        int *v = (int *)(rec + 4);
        if (func_ov004_021dbb20(*(int *)(rec + 4)) == ~1) func_ov004_021dd37c(20);
        else if (func_ov004_021dbb20(*v) == ~2) func_ov004_021dd37c(21);
        else func_ov004_021dd37c(24);
        return -1;
    }
    if (t != 1) { arg2[0]++; return arg0; }
    r = func_ov004_021dc9dc(rec + 4, data_ov004_02291450);
    if (r < 0) {
        if (r == ~1) { func_ov004_021dd37c(22); return -1; }
        arg2[0]++;
        return arg0;
    }
    *(int *)data_ov004_022913a4 = func_ov004_021dc60c(func_ov004_021dbb08(*(unsigned short *)(p + 12)));
    arg2[0] = 0;
    return 1;
}
