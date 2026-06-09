#pragma thumb on
extern char data_ov004_02291630[];
extern void func_ov004_021dbe5c(void *p, int v, int n);
extern int func_ov004_021dbd6c(int x);
extern int func_ov004_021dbd84(int x);
extern void func_ov004_021dbddc(int a, int b, int c, int d, void *e, int f);
void func_ov004_021dc350(int a0, int a1, int a2, int a3) {
    char buf[8];
    func_ov004_021dbe5c(buf, 0, 8);
    buf[1] = 2;
    *(unsigned short *)(buf + 2) = func_ov004_021dbd6c(0x5790);
    *(int *)(buf + 4) = func_ov004_021dbd84(*(int *)(data_ov004_02291630 + 16));
    if (a2 == 255 || data_ov004_02291630[24] == 0)
        *(int *)(buf + 4) = -1;
    func_ov004_021dbddc(a3, a0, a1, 0, buf, 8);
}
