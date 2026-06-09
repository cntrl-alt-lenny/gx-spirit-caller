#pragma thumb on
extern int func_ov004_021dbd1c(int x);
extern void func_ov004_021dbe68(void *p, void *q, int n);
int func_ov004_021dc954(unsigned char *a, void *b) {
    unsigned char *p = a + 6;
    int n = func_ov004_021dbd1c(*(unsigned short *)(p + 2));
    if (n <= 0) return -1;
    if (*p != 112) return -1;
    func_ov004_021dbe68(b, p + 6, n);
    return 0;
}
