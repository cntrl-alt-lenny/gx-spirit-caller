#pragma thumb on
extern char data_ov004_022913d0[];
extern void func_ov004_021dbc48(void *p, int v, int n);
extern int func_ov004_021dbb58(int x);
extern int func_ov004_021dbb70(int x);
extern void func_ov004_021dbbc8(int a, int b, int c, int d, void *e, int f);
void func_ov004_021dc13c(int a0, int a1, int a2, int a3) {
    char buf[8];
    func_ov004_021dbc48(buf, 0, 8);
    buf[1] = 2;
    *(unsigned short *)(buf + 2) = func_ov004_021dbb58(0x5790);
    *(int *)(buf + 4) = func_ov004_021dbb70(*(int *)(data_ov004_022913d0 + 16));
    if (a2 == 255 || data_ov004_022913d0[24] == 0)
        *(int *)(buf + 4) = -1;
    func_ov004_021dbbc8(a3, a0, a1, 0, buf, 8);
}
