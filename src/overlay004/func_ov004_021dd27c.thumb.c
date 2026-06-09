#pragma thumb on
extern char data_ov004_0220a300[];
extern char data_ov004_0220a2f8[];
extern int func_ov004_021dbd08(void *p);
extern void func_ov004_021dbe68(void *p, void *q, int n);
int func_ov004_021dd27c(int *s) {
    s[0] = func_ov004_021dbd08(data_ov004_0220a300);
    func_ov004_021dbe68((char *)s + 4, data_ov004_0220a300, s[0]);
    s[9] = 1;
    s[10] = func_ov004_021dbd08(data_ov004_0220a2f8);
    if ((unsigned)s[10] > 13) return -1;
    func_ov004_021dbe68((char *)s + 44, data_ov004_0220a2f8, s[10]);
    return 0;
}
