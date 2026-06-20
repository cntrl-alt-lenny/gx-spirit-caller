#pragma thumb on
extern char data_ov004_0220a0a0[];
extern char data_ov004_0220a098[];
extern int func_ov004_021dbaf4(void *p);
extern void func_ov004_021dbc54(void *p, void *q, int n);
int func_ov004_021dd068(int *s) {
    s[0] = func_ov004_021dbaf4(data_ov004_0220a0a0);
    func_ov004_021dbc54((char *)s + 4, data_ov004_0220a0a0, s[0]);
    s[9] = 1;
    s[10] = func_ov004_021dbaf4(data_ov004_0220a098);
    if ((unsigned)s[10] > 13) return -1;
    func_ov004_021dbc54((char *)s + 44, data_ov004_0220a098, s[10]);
    return 0;
}
