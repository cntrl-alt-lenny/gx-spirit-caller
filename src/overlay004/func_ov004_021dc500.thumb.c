#pragma thumb on
extern char data_ov004_02291618[];
extern char data_ov004_0220a2f8[];
extern void func_ov004_021dbe5c(void *p, int v, int n);
extern void func_ov004_021dbe68(void *p, void *q, int n);
extern int func_ov004_021dbd08(void *p);
extern void func_ov004_021dc020(void *p, int n, void *q, int x);
extern void func_ov004_021dc3b8(void *a, int b, int c, int d, int e, int f, void *g);
extern void func_ov004_021dc350(void *a, int b, int c, int d);
int func_ov004_021dc500(int a0, char *a1, int a2) {
    char local[8];
    char *buf = *(char **)data_ov004_02291618;
    func_ov004_021dbe5c(buf, 0, 1500);
    func_ov004_021dbe68(local, a1 + 16, 8);
    func_ov004_021dc020(local, 8, data_ov004_0220a2f8, func_ov004_021dbd08(data_ov004_0220a2f8));
    func_ov004_021dc3b8(buf, 0x3000, 0, 0, 0, 17, local);
    func_ov004_021dc350(buf, 24, 0, a2);
    return 0;
}
