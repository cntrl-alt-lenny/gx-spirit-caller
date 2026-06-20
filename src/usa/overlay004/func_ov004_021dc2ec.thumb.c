#pragma thumb on
extern char data_ov004_022913b8[];
extern char data_ov004_0220a098[];
extern void func_ov004_021dbc48(void *p, int v, int n);
extern void func_ov004_021dbc54(void *p, void *q, int n);
extern int func_ov004_021dbaf4(void *p);
extern void func_ov004_021dbe0c(void *p, int n, void *q, int x);
extern void func_ov004_021dc1a4(void *a, int b, int c, int d, int e, int f, void *g);
extern void func_ov004_021dc13c(void *a, int b, int c, int d);
int func_ov004_021dc2ec(int a0, char *a1, int a2) {
    char local[8];
    char *buf = *(char **)data_ov004_022913b8;
    func_ov004_021dbc48(buf, 0, 1500);
    func_ov004_021dbc54(local, a1 + 16, 8);
    func_ov004_021dbe0c(local, 8, data_ov004_0220a098, func_ov004_021dbaf4(data_ov004_0220a098));
    func_ov004_021dc1a4(buf, 0x3000, 0, 0, 0, 17, local);
    func_ov004_021dc13c(buf, 24, 0, a2);
    return 0;
}
